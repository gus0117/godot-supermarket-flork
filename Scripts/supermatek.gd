extends Node

#Prefabs
@export var florkCart : PackedScene

#Fast Line
@onready var box_1: Path2D = $Box1

#Common Line
@onready var line: Path2D = $Line

#Boxes lines
@onready var box_2: Path2D = $Box2
@onready var box_3: Path2D = $Box3
@onready var box_4: Path2D = $Box4

#Lines positions, where the first position is the box position
var box_1_positions : Array[float] = [0.65, 0.52, 0.42, 0.32, 0.22]
var line_positions: Array[float] = [1.00, 0.86, 0.62, 0.43, 0.22]

#Positions to enter in the box
var box_2_position : float = 0.52
var box_3_position : float = 0.55
var box_4_position : float = 0.61

func _ready():
	pass


func spawnFlorkCart() -> void:
	var flork_instance = florkCart.instantiate()
	#For now, I instantiate a flork on box 1 to test de funtion
	flork_instance.global_position = box_1.global_position
	box_1.add_child(flork_instance)
	
	#This make than the flork walk througth the path
	flork_instance.set_next_pos(0.8)


func _on_timer_timeout():
	spawnFlorkCart()
