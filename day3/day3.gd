class_name D3 extends RefCounted

static func solution_of(_input: StringName) -> String:
    var raw_data: String = Utils.read_as_string(_input)
    var filtered_data: Array[String]
    var regex = RegEx.new()
    regex.compile(r'mul\(\d+\,\d+\)')

    for result in regex.search_all(raw_data):
        filtered_data.append(result.get_string())
    
    #print(filtered_data)

    var data: Array[Vector2]
    for f: String in filtered_data:
        var sp: PackedStringArray = f.split(",")
        var res = Vector2(int(sp[0].lstrip("mul(")), int(sp[1].rstrip(")")))
        data.append(res)

    #print(data)

    var result: int = 0
    for d: Vector2i in data:
        result += d.x * d.y

    return "%d" % result