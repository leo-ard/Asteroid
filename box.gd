extends Area2D

const BOX_SIZE = 7900

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation = -get_parent().rotation;
	pass

func _on_box_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.is_in_group("teleportable")):
		match area_shape:
			0:body.position += Vector2(BOX_SIZE, 0)
			1:body.position += Vector2(0, BOX_SIZE)
			2:body.position += Vector2(-BOX_SIZE, 0)
			3:body.position += Vector2(0, -BOX_SIZE)
		pass
	pass
