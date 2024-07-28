extends Node2D

@export var creatures: Array[PackedScene]
@export var mobs_per_minute: float = 60.0

@onready var path_follow_2d: PathFollow2D = %PathFollow2D
var cooldown: float = 0.0


func _process(delta: float):
	# Temporizador (cooldown)
	cooldown -= delta
	if cooldown > 0: return
	
	# Frequência: Monstros por minuto
	# 60 monstros/min = 1 monstros por segundo
	# 120 monstros/min = 2 monstros por segundo
	# Intervalo em segundos entre monstros => 60 / frequência
	# 60 / 60 = 1
	# 60 / 120 = 0.5
	# 60 / 30 = 2
	# interval = 60.0 / mobs por segundp
	# Frequência
	var interval = 60.0 / mobs_per_minute
	cooldown = interval

	# Pegar criatura aleatória
	# Pegar ponto aleatório
	# Instanciar cena
	# Colocar na posição
	# Definir o parent
	
	# Instanciar uma criatura aleatória
	var index = randi_range(0, creatures.size() - 1)
	var creature_scene = creatures[index]
	var creature = creature_scene.instantiate()
	creature.global_position = get_point()
	get_parent().add_child(creature)


func get_point() -> Vector2:
	path_follow_2d.progress_ratio = randf()
	return path_follow_2d.global_position
