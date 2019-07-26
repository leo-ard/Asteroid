extends Node

const STAR_OBJECT = preload("res://scenes/Star.tscn")
onready var PLAYER : Node2D = get_parent()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1000):
		var star := STAR_OBJECT.instance()
		star.proximity = (randi()%10)^2 + 1
		var maxi = 5000
		star.base_position = Vector2(randi()%maxi, randi()%maxi)
		star.PLAYER = PLAYER
		
		add_child(star)
	#array.append(Star(10, Vector2(50, 50)));
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
