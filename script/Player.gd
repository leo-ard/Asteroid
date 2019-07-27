extends RigidBody2D

class_name Player

const FORCE_SIDE = 5
const MAIN_FORCE = 10
const BREAK_FORCE = 5

const BULLET = preload("res://scenes/Bullet.tscn")

onready var truster_animation = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("shoot")):
		fire()
	
func _physics_process(delta):
	var pos = get_viewport().get_mouse_position() - get_viewport().size / 2
	var angle = pos.angle() + PI/2
	rotation = angle
	
	print(position)
	
	# movement
	
	var vel := Vector2()
	if(Input.is_action_pressed("down")):
		vel.y += FORCE_SIDE
	if(Input.is_action_pressed("up")):
		vel.y -= MAIN_FORCE
	if(Input.is_action_pressed("right")):
		vel.x -= FORCE_SIDE
	if(Input.is_action_pressed("left")):
		vel.x += FORCE_SIDE
		
	vel = vel.rotated(angle)
	apply_impulse(Vector2(), vel)
	
	if(Input.is_action_pressed("break")):
		apply_impulse(Vector2(), self.linear_velocity.normalized() * -1 * BREAK_FORCE)
	elif(vel == Vector2()):
		apply_impulse(Vector2(), self.linear_velocity.normalized() * -1 * BREAK_FORCE/2)
		
	#animation
	if(Input.is_action_pressed("up")):
		if(truster_animation.frame < 5):
			truster_animation.frame+=1
	else:
		if(truster_animation.frame > 0):
			truster_animation.frame-=1

func fire() :
	var bullet = BULLET.instance()
	bullet.global_position = $FirePosition.global_position
	bullet.global_rotation = global_rotation
	var temp =  get_rotation_vector() * 3000
	bullet.velocity = temp
	get_parent().add_child(bullet)

func get_rotation_vector():
	return Vector2(cos(rotation - PI/2), sin(rotation - PI/2))
	

