extends KinematicBody2D

export (int) var run_speed = 100 
export var controls: Dictionary = {
	'Up': int(),
	'Down': int(),
	'Left': int(),
	'Right': int(),
}

var velocity = Vector2()
var jumping = false


func get_input():
	velocity.x = 0
	velocity.y = 0
	var right = Input.is_key_pressed(controls['Right'])
	var left = Input.is_key_pressed(controls['Left'])
	var up = Input.is_key_pressed(controls['Up'])
	var down = Input.is_key_pressed(controls['Down'])
	

	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	if up:
		velocity.y -= run_speed
	if down:
		velocity.y += run_speed

func _physics_process(delta):
	get_input()

	velocity = move_and_slide(velocity, Vector2(0, -1))
	if get_slide_count() != 0:
		for collision in range(0, get_slide_count()):
			if get_slide_collision(collision).collider.get_collision_layer() == 1:
				pass
			else:
				get_parent().player_dead(self, get_slide_collision(collision).collider)
				break

func _to_string():
	return "Player name"



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
