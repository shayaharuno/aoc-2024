class_name D1 extends RefCounted

static func result_of(_input: StringName) -> int:
	var val_size: int = 5
	var gap_size: int = 3

	var raw_data: Array[String]
	var int0_data: Array[int]
	var int1_data: Array[int]
	var result_data: Array[int]

	raw_data = Utils.read_file(_input)

	var result: int = 0
	for i: int in range(raw_data.size()):
		int0_data.append(combine_numbers(raw_data[i], 0, val_size))
		int1_data.append(combine_numbers(raw_data[i], val_size+gap_size, val_size))

	int0_data.sort()
	int1_data.sort()

	for i: int in range(int0_data.size()):
		result_data.append(abs(int0_data[i] - int1_data[i]))
		result += result_data[i]

	return result


static func combine_numbers(_input_string: String, _start_index: int, _val_size: int) -> int:
	var output: String = ""

	for i: int in range(_val_size):
		output += _input_string[_start_index + i]

	return int(output)


