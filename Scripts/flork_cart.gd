extends PathFollow2D

class_name FlorkCart

const SPEED : float = 350

var next_pos: float = 0
var move_next: bool = false

var amount_products: int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_path_follow(delta)

# Check if any box are avaible. If it is not, get a line position
func check_line() -> void:
	if get_parent().name == "Box1":
		set_next_pos(GLOBAL.get_pos_fast_line())
	elif get_parent().name == "Line":
		var box = GLOBAL.get_box_avaible()
		if box == "Line":
			set_next_pos(GLOBAL.get_line_pos())
		else:
			#Set new parent
			print("Change parent")

# Move the path follow 2d throuth the path.
func move_path_follow(delta) -> void:
		if move_next:
			set_progress(get_progress() + SPEED * delta)
			if progress_ratio >= next_pos:
				move_next = false
				$AnimationPlayer.stop()

# Assign a new position to move.
func set_next_pos(np: float) -> void:
	if next_pos == np:
		pass
	next_pos = np
	move_next = true
	$AnimationPlayer.play("walk")
	print("Enter set next pos")

func set_amount_products(p: int) -> void:
	amount_products = p
	$Sprite2D/Control/AmountProducts.text = str(amount_products)
