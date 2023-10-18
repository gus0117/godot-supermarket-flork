extends Node

var cant_box_1: int = 0
var cant_box_2: int = 0
var cant_box_3: int = 0
var cant_box_4: int = 0

#line box_1 box_2 box_3 box_4
var array_boxes = {"Line": 0, "Box1": 0, "Box2": 0, "Box3": 0, "Box4": 0}


#Lines positions, where the first position is the box position
var box_1_positions : Array[float] = [0.65, 0.52, 0.42, 0.32, 0.22]
var line_positions: Array[float] = [1.00, 0.86, 0.62, 0.43, 0.22]

#Positions to enter in the box
var box_2_position : float = 0.52
var box_3_position : float = 0.55
var box_4_position : float = 0.61

# If the fast box is full, return a line position.
func get_pos_fast_line() -> float:
	if cant_box_1 > box_1_positions.size():
		return 0.0
	cant_box_1 += 1
	return box_1_positions[cant_box_1]

# Return the box avaible to pay. If there is not a box avaible, return the line.
func get_box_avaible() -> String :
	var box_avaible : String = array_boxes[0]
	for box in array_boxes:
		if box == "Line" or box == "Box1":
			continue
		if array_boxes[box] == 0:
			box_avaible = box
			break
	return box_avaible

func get_line_pos() -> float :
	if array_boxes["Line"] > line_positions.size():
		return -1
	return line_positions[array_boxes["Line"]]
