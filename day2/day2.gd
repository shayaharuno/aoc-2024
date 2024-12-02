class_name D2 extends RefCounted

static func solution_of(_input: StringName) -> String:
	# First Part
	var step_max: int = 3
	var unsafe_count: int = 0
	var raw_data: Array[String] = Utils.read_file(_input)
	var split_data: Array[PackedStringArray] = Utils.split_data(raw_data, " ")
	var result_data: Array[String]

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
	# Second Part
	print(raw_data)
	var dampened_result: int = 0

	return "%d (%s)" % [(result_data.size()-unsafe_count), dampened_result]
