class_name D4 extends RefCounted

static func solution_of(_input: StringName) -> String:
    const KEY: String = "XMAS"
    var occurances: int = 0
    var data: Array[String] = Utils.read_file(_input)
    for row: int in range(data.size()):
        for chr: int in range(len(data[row])):
            if data[row][chr] == KEY[0]:
                occurances += search_around(KEY, row, chr, data)
                
    return "%s" % occurances


static func search_around(_key: String, _row: int, _chr: int, _data: Array[String]) -> int:
    var result: int = 0
    var max_row: int = _data.size()
    var max_chr: int = len(_data[_row])
    var key_len: int = len(_key)-1

    #Vertical and Diagonal Checks
    if _row + key_len < max_row: # Vertical Check: Down
        if _data[_row + 1][_chr] == _key[1] and _data[_row + 2][_chr] == _key[2] and _data[_row + 3][_chr] == _key[3]:
            result += 1
        if _chr + key_len < max_chr: # Diagonal Check: Right
            if _data[_row + 1][_chr + 1] == _key[1] and _data[_row + 2][_chr + 2] == _key[2] and _data[_row + 3][_chr + 3] == _key[3]:
                result += 1
        if _chr - key_len >= 0: # Diagonal Check: Left
            if _data[_row + 1][_chr - 1] == _key[1] and _data[_row + 2][_chr - 2] == _key[2] and _data[_row + 3][_chr - 3] == _key[3]:
                result += 1

    if _row - key_len >= 0: # Vertical Check: Up
        if _data[_row - 1][_chr] == _key[1] and _data[_row - 2][_chr] == _key[2] and _data[_row - 3][_chr] == _key[3]:
            result += 1
        if _chr + key_len < max_chr: # Diagonal Check: Right
            if _data[_row - 1][_chr + 1] == _key[1] and _data[_row - 2][_chr + 2] == _key[2] and _data[_row - 3][_chr + 3] == _key[3]:
                result += 1
        if _chr - key_len >= 0: # Diagonal Check: Left
            if _data[_row - 1][_chr - 1] == _key[1] and _data[_row - 2][_chr - 2] == _key[2] and _data[_row - 3][_chr - 3] == _key[3]:
                result += 1

    # Horizontal Checks
    if _chr + key_len < max_chr: # Horizontal Check: Right
        if _data[_row][_chr + 1] == _key[1] and _data[_row][_chr + 2] == _key[2] and _data[_row][_chr + 3] == _key[3]:
            result += 1
    if _chr - key_len >= 0: # Horizontal Check: Right
        if _data[_row][_chr - 1] == _key[1] and _data[_row][_chr - 2] == _key[2] and _data[_row][_chr - 3] == _key[3]:
            result += 1
            
    return result