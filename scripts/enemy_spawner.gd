extends Node2D

signal enemy_spawned(enemy_instance)

@export var _spawn_position_list: Node2D

var _enemy_scene = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
	_spawn_enemy()

func _spawn_enemy() -> void:
	var spawn_position_list := _spawn_position_list.get_children()
	var spawn_position = spawn_position_list.pick_random()
	
	var enemy_instance = _enemy_scene.instantiate()
	enemy_spawned.emit(enemy_instance)
	
	enemy_instance.global_position = spawn_position.global_position
