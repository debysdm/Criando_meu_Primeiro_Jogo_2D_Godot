extends Node

@export var speed: float = 1

var enemy: Enemy
var sprite: AnimatedSprite2D

func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	# Calcular direção
	var player_position = GameManager.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	#Movimento
	enemy.velocity = input_vector * speed * 100.0
	enemy.move_and_slide()
#	
#	input vector = vector2 que varia entre -1 e 1 em ambos os eixos
#	velocity = input vector * speed * 100.0
	
	#Girar sprite
	if input_vector.x > 0:
		sprite.flip_h = false
	elif input_vector.x < 0:
		sprite.flip_h = true
