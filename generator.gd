extends Timer

onready var timer = $Timer
var ASTEROID = preload("res://scenes/Asteroid.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_generator_timeout():
	var ast = ASTEROID.instance()
	ast.global_position = get_parent().get_node("position").global_position
	ast.push()
	get_tree().get_root().add_child(ast)
