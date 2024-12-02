extends Node

func read_file(filepath: StringName) -> Array[String]:
	var _raw_data: Array[String]
	var _file = FileAccess.open(filepath, FileAccess.READ)
	while _file.get_position() < _file.get_length():
		_raw_data.append(_file.get_line())
	return _raw_data


func split_data(_data: Array[String], _delimeter: String) -> Array[PackedStringArray]:
	var d: Array[String]
	var res: Array[PackedStringArray]
	for i in range(_data.size()):
		d.append(_data[i])
		res.append(d[i].split(_delimeter, false, 0))
	return res
