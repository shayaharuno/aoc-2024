extends Node

var step_max: int = 3
var step_min: int = 1
var unsafe_count: int = 0

var raw_data: Array[String]
var split_data: Array[PackedStringArray]
var result_data: Array[String]

func _ready() -> void:
    raw_data = Utils.read_file("day2/input.txt")
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
                    result_data[i] = "Not Safe"
                    unsafe_count+=1
                    break
                if j > 1:
                    if new_sign != diff_sign:
                        result_data[i] = "Not Safe"
                        unsafe_count+=1
                        break
                    

    #print(split_data)
    #print(result_data)
    print(result_data.size()-unsafe_count)

