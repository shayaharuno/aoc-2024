class_name D2 extends RefCounted

static func result_of(_input: StringName) -> int:
    var step_max: int = 3
    var unsafe_count: int = 0
    var tolerate: int = 0

    var raw_data: Array[String]
    var split_data: Array[PackedStringArray]
    var result_data: Array[String]

    raw_data = Utils.read_file(_input)
    split_data = Utils.split_data(raw_data, " ")
    result_data.resize(split_data.size())
    result_data.fill("Safe")

    for i: int in range(split_data.size()):
        var diff_sign: int = 1
        for j: int in range(split_data[i].size()):
            if j > 0:
                var a: int = int(split_data[i][j-1])
                var b: int = int(split_data[i][j])
                var diff: int = a - b
                var new_sign = sign(diff)
                if j == 1: diff_sign = new_sign
                if abs(diff) > step_max:
                    tolerate += 1
                    if tolerate < 2:
                        result_data[i] = "Not Safe"
                        unsafe_count+=1
                        break
                if j > 1:
                    if new_sign != diff_sign:
                        tolerate += 1
                        if tolerate < 2:
                            result_data[i] = "Not Safe"
                            unsafe_count+=1
                            break
        tolerate = 0

    #print(split_data)
    #print(result_data)
    #print(result_data.size()-unsafe_count)

    return result_data.size()-unsafe_count

