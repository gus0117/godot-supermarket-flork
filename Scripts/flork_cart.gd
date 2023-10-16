extends PathFollow2D

class_name FlorkCart

const SPEED : float = 350

var next_pos: float = 0
var move_next: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_path_follow(delta)


func move_path_follow(delta) -> void:
		if move_next:
			set_progress(get_progress() + SPEED * delta)
			if progress_ratio >= next_pos:
				move_next = false
				$AnimationPlayer.stop()

func set_next_pos(np: float) -> void:
	if next_pos == np:
		pass
	next_pos = np
	move_next = true
	$AnimationPlayer.play("walk")
	print("Enter set next pos")
