class_name D1 extends RefCounted

static func solution_of(_input: StringName) -> String:
    # First Part
    var result: int = 0
    var raw_data: Array[String] = Utils.read_file(_input)
    var split_data: Array[PackedStringArray] = Utils.split_data(raw_data, "   ")

    var data_a: Array[int]
    var data_b: Array[int]

    for i: int in range(split_data.size()):
        data_a.append(int(split_data[i][0]))
        data_b.append(int(split_data[i][1]))

    data_a.sort()
    data_b.sort()

    var result_data: Array[int]
    for i: int in range(data_a.size()):
        result_data.append(abs(data_a[i] - data_b[i]))
        result += result_data[i]

    # Second Part
    var sim_score: int = 0
    for i: int in range(data_a.size()):
        sim_score += data_b.count(data_a[i]) * data_a[i]

    return "%d (%s)" % [result, sim_score]
