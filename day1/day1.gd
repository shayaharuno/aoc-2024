extends Node

var val_size: int = 5
var gap_size: int = 3

var raw_data: Array[String]
var int0_data: Array[int]
var int1_data: Array[int]
var result_data: Array[int]
var data0: Array[int]
var data1: Array[int]

func _ready() -> void:
	read_file("day1/input.txt")

	var result: int = 0
	for i: int in range(raw_data.size()):
		int0_data.append(combine_numbers(raw_data[i], 0, val_size))
		int1_data.append(combine_numbers(raw_data[i], val_size+gap_size, val_size))

	int0_data.sort()
	int1_data.sort()

	for i: int in range(int0_data.size()):
		result_data.append(abs(int0_data[i] - int1_data[i]))
		result += result_data[i]

	print("Data Size: %s" % raw_data.size())
	print("Result: %s" % result)


func read_file(filepath: StringName):
	var file = FileAccess.open(filepath, FileAccess.READ)
	while file.get_position() < file.get_length():
		raw_data.append(file.get_line())


func combine_numbers(_input_string: String, _start_index: int, _val_size: int) -> int:
	var output: String = ""

	for i: int in range(_val_size):
		output += _input_string[_start_index + i]

	return int(output)


