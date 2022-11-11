extends KinematicBody2D

const dirs = ["Left", "Right"]

var dir_start = dirs[randi() % dirs.size()]
var dir = Vector2.ZERO

func _init():
	if dir_start == "Left":
		self.position = Vector2(10, randi() % 450)
		dir = Vector2(-1, 0)
	else:
		self.position = Vector2(655, randi() % 450)
		dir = Vector2(1, 0)

func _process(delta):
	move_and_slide(Vector2(-30, 0) * dir)

func disappear():
	queue_free()

