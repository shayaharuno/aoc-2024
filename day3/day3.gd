class_name D3 extends RefCounted

static func solution_of(_input: StringName) -> String:
    var raw_data: String = Utils.read_as_string(_input)
    var filtered_data: Array[String]
    var regex = RegEx.new()
    regex.compile(r"(?<donts>don't\(\))|(?<muls>mul\(\d+\,\d+\))|(?<dos>do\(\))")

    for result in regex.search_all(raw_data):
        filtered_data.append(result.get_string())
    
    #print(filtered_data)

    var unfiltered_data: Array[Vector2i]
    var data: Array[Vector2i]
    var ignore: bool = false
    for f: String in filtered_data:
        if f[0] == "m":
            var up: PackedStringArray = f.split(",")
            var ures = Vector2i(int(up[0].lstrip("mul(")), int(up[1].rstrip(")")))
            unfiltered_data.append(ures)
        if f == "don\'t()":
            ignore = true
        elif f == "do()":
            ignore = false
        elif not ignore:
            var sp: PackedStringArray = f.split(",")
            var res = Vector2i(int(sp[0].lstrip("mul(")), int(sp[1].rstrip(")")))
            data.append(res)

    #print(data)

    var unfiltered_result: int = 0
    for d: Vector2i in unfiltered_data:
        unfiltered_result += d.x * d.y

    var result: int = 0
    for d: Vector2i in data:
        result += d.x * d.y

    return "%d (%d)" % [unfiltered_result, result]