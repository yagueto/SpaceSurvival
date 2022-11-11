extends Control

var winner: String

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	$Label.text = winner + " has won."


func _on_Button_pressed():
	var win_scene = load("res://World.tscn").instance()
	get_parent().add_child(win_scene)
	queue_free() # TODO
