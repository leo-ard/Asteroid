extends KinematicBody2D

class_name Asteroid_tiny

var velocity = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hit():
	queue_free()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.is_in_group("Asteroid"):
			hit()
			
