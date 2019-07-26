extends RigidBody2D

class_name Asteroid

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var random_angle = (randi() % 360  * PI) / 180
	print(random_angle)
	
	apply_impulse(Vector2(randi()%3-1, randi()%3-1), 1000 * Vector2(cos(random_angle), sin(random_angle)))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
