extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

@export var _spawn_position_list: Node2D

var _enemy_scene = preload("res://scenes/enemy.tscn")
var _path_enemy_scene = preload("res://scenes/path_enemy.tscn")

func _on_timer_timeout() -> void:
	_spawn_enemy()

func _spawn_enemy() -> void:
	var spawn_position_list := _spawn_position_list.get_children()
	var spawn_position = spawn_position_list.pick_random()
	
	var enemy_instance = _enemy_scene.instantiate()
	enemy_spawned.emit(enemy_instance)
	
	enemy_instance.global_position = spawn_position.global_position

func _on_path_enemy_timer_timeout() -> void:
	_spawn_path_enemy()

func _spawn_path_enemy() -> void:
	var path_enemy_instance = _path_enemy_scene.instantiate()
	path_enemy_spawned.emit(path_enemy_instance)
	
