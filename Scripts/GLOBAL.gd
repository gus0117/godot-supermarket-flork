extends Node

var cant_box_1: int = 0
var cant_box_2: int = 0
var cant_box_3: int = 0
var cant_box_4: int = 0


#Lines positions, where the first position is the box position
var box_1_positions : Array[float] = [0.65, 0.52, 0.42, 0.32, 0.22]
var line_positions: Array[float] = [1.00, 0.86, 0.62, 0.43, 0.22]

#Positions to enter in the box
var box_2_position : float = 0.52
var box_3_position : float = 0.55
var box_4_position : float = 0.61


func get_pos_fast_line() -> float:
	if cant_box_1 > box_1_positions.size():
		return 0.0
	cant_box_1 += 1
	return box_1_positions[cant_box_1]

func get_box_avaible() -> String :
	var box_avaible : String = ""
	if cant_box_2 != 0:
		return "Box2"
	if cant_box_3 != 0:
		return "Box3"
	if cant_box_4 != 0:
		return "Box4"
	return box_avaible
