extends Area2D

@export var _speed: float = 120

func _physics_process(delta: float) -> void:
	global_position.x -= _speed * delta
