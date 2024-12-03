class_name D2 extends RefCounted

static func solution_of(_input: StringName) -> String:
    # First Part
    var step_max: int = 3
    var unsafe_count: int = 0
    var safe_count_dampened: int = 0
    var raw_data: Array[String] = Utils.read_file(_input)
    var split_data: Array[PackedStringArray] = Utils.split_data(raw_data, " ")
    var unsafe_data: Array[PackedStringArray]

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
                    unsafe_data.append(split_data[i])
                    unsafe_count += 1
                    break
                if j > 1:
                    if new_sign != diff_sign:
                        unsafe_data.append(split_data[i])
                        unsafe_count += 1
                        break

    # Second Part
    for i: int in range(unsafe_data.size()):
        var line_len: int = unsafe_data[i].size()
        for j: int in range(line_len):
            var temp_arr: PackedStringArray
            temp_arr = unsafe_data[i].duplicate()
            temp_arr.remove_at(j)
            var skip: bool = false
            var diff_sign: int = 1
            for k: int in range(temp_arr.size()):
                if k > 0:
                    var a: int = int(temp_arr[k-1])
                    var b: int = int(temp_arr[k])
                    var diff: int = a - b
                    var new_sign = sign(diff)
                    if k == 1: diff_sign = new_sign
                    if abs(diff) > step_max:
                        skip = true
                        break
                    if k > 1:
                        if new_sign != diff_sign:
                            skip = true
                            break
            if skip == false:
                safe_count_dampened += 1
                break;

    var result: int = (split_data.size()-unsafe_count)
    return "%d (%s)" % [result, result + safe_count_dampened]
