extends Node2D

class_name Star

var proximity = 1 setget set_proximity
var base_position := Vector2() setget set_base_pos

var PLAYER : Node2D
const NB = 20_000

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var index = PLAYER.position.x as int / NB
	var indey = PLAYER.position.y as int / NB
	
	#car -7/NB --> 0 si NB > abs(-7). Or on veut que ca = -1
	if(PLAYER.position.x < 0):
		index-=1
	if(PLAYER.position.y < 0):
		indey-=1
	
	#calcule les distances entre la position actuelle du joueur et l'étoile dans chaque quadrant. 
	var distanceXM1 = abs(PLAYER.position.x - (base_position.x + NB * (index-1)))
	var distanceXN = abs(PLAYER.position.x - (base_position.x + NB * index))
	var distanceXP1 = abs(PLAYER.position.x - (base_position.x + NB * (index + 1)))
	
	#On ajuste l'index en fonction de la plus petite distance
	if(distanceXM1 < distanceXN and distanceXM1 < distanceXP1):
		index-=1
	elif(distanceXP1 < distanceXN and distanceXP1 < distanceXM1):
		index+=1
	
	#MM chose pour Y
	#calcule les distances entre la position actuelle du joueur et l'étoile dans chaque quadrant. 
	var distanceYM1 = abs(PLAYER.position.y - (base_position.y + NB * (indey-1)))
	var distanceYN = abs(PLAYER.position.y - (base_position.y + NB * indey))
	var distanceYP1 = abs(PLAYER.position.y - (base_position.y + NB * (indey + 1)))
	
	#On ajuste l'index en fonction de la plus petite distance
	if(distanceYM1 < distanceYN and distanceYM1 < distanceYP1):
		indey-=1
	elif(distanceYP1 < distanceYN and distanceYP1 < distanceYM1):
		indey+=1
		
	var new_base = base_position + Vector2(NB * index, NB * indey)
	position = new_base + (PLAYER.position - new_base) * proximity/100

func set_proximity(prox : int):
	proximity = prox
	scale = Vector2(20-proximity/5, 20-proximity/5)

	
func set_base_pos(pos : Vector2):
	base_position = pos
