extends KinematicBody2D

class_name Asteroid

var velocity = Vector2()
var ASTEROID = preload("res://scenes/Asteroid_tiny.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

func push():
	var random_angle = (randi() % 360  * PI) / 180
	velocity =  1000 * Vector2(cos(random_angle), sin(random_angle))
	
func hit():
	queue_free()
	var angle = randi()%360
	for i in range(4):
		print(angle)
		var ast = ASTEROID.instance()
		
		var vec = Vector2(cos(angle * PI / 180), sin(angle * PI / 180))
		
		ast.velocity = 1000 * vec
		ast.global_position = global_position + 70*vec
		get_tree().get_root().add_child(ast)
		
		angle += randi()%30 + 75
	
	
var i = 0
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.is_in_group("Asteroid"):
			collision.collider.hit()
			
		
