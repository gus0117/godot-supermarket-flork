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

#Random Generator
var rng = RandomNumberGenerator.new() 
var amount_clients : int = 0

#Probability to generate a client
const PRO : float = 0.7
const MAX_AMOUN_CLIENTS : int = 5


func spawnFlorkCart() -> void:
	var flork_instance = florkCart.instantiate()
	flork_instance.set_amount_products(rng.randi_range(16, 30))
	#The client go to rapid box
	if flork_instance.amount_products <= 15:
		#Chance of the buyer to go to rapid line
		if rng.randf() < 0.8:
			flork_instance.global_position = box_1.global_position
			box_1.add_child(flork_instance)
			GLOBAL.array_boxes["box1"] += 1
	else:
		flork_instance.global_position = line.global_position
		line.add_child(flork_instance)
	#Make the flork start to move in the line
	flork_instance.check_line()


func _on_timer_timeout():
	if amount_clients > MAX_AMOUN_CLIENTS:
		return
	
	# probability to generate a client
	if rng.randf() > PRO:
		amount_clients += 1
		spawnFlorkCart()
