extends Node2D

var enemies: Array = []
const MAX_ENEMY_NUMBER: int = 100
var time_to_enemy = 0
var score = {"Player 1": 0, "Player 2": 0}

var enemy = preload("res://Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	
	time_to_enemy += delta
	if time_to_enemy < 0.5:
		pass
	else:
		time_to_enemy = 0
		if $Enemies.get_child_count() < MAX_ENEMY_NUMBER: # Get number of enemies in screen
			var e = enemy.instance()
			$"Enemies".add_child(e)

func player_dead(player: KinematicBody2D, enemy: KinematicBody2D):
	player.position = get_node(player.name + " Spawn").position
	enemy.disappear()
	var label = get_node('UI/' + player.name)
	score[player.name] += 1
	label.text = str(score[player.name])
	if int(label.text) == 10:
		var win_scene = load("res://end.tscn").instance()
		if player.name == "Player 1":
			win_scene.winner = "Player 2"
		else:
			win_scene.winner = "Player 1"
		get_parent().add_child(win_scene)
		queue_free() 


func _on_OutOfScreen_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	var players = str(body).left(6)
	if players != "Player" and body:
		body.disappear()


func _on_Winner_body_entered(body):
	if str(body) != "Player name":
		return

	var player = body
	player.position = get_node(player.name + " Spawn").position
	var label = get_node('UI/' + player.name)
	score[player.name] -= 1
	label.text = str(score[player.name])
