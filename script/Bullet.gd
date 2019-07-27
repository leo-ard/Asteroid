extends KinematicBody2D

var velocity

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			queue_free()
