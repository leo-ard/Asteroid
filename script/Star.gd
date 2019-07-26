extends Node2D

class_name Star

var proximity = 1 setget set_proximity
var base_position := Vector2() setget set_base_pos

var PLAYER : Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = base_position + (base_position - PLAYER.position) * proximity/100

func set_proximity(prox : int):
	proximity = prox
	scale = Vector2(proximity/2 + 2, proximity/2 + 5)

	
func set_base_pos(pos : Vector2):
	base_position = pos
