class_name D1 extends RefCounted

static func result_of(_input: StringName) -> int:
	var result: int = 0
	var sim_score: int = 0

	# First Part
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

	#Second Part
	var _sim_score: int = 0
	for i: int in range(data_a.size()):
		_sim_score = data_b.count(data_a[i]) * data_a[i]
		sim_score += _sim_score


	#return sim_score
	return result