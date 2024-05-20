extends Area2D

signal died

@export var _speed: float = 120

func _physics_process(delta: float) -> void:
	global_position.x -= _speed * delta

func _on_body_entered(body: Node2D) -> void:
	die()
	body.take_damage()

func die() -> void:
	died.emit()
	queue_free()
