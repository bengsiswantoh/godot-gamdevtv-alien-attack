extends Node2D

@export var _player: CharacterBody2D
@export var _ui: CanvasLayer
@export var _hud: Control
@export var _enemy_hit_sound: AudioStreamPlayer
@export var _player_hit_sound: AudioStreamPlayer

var _game_over_scene = preload("res://scenes/game_over_screen.tscn")

var _lives: int = 3
var _score: int = 0

func _ready() -> void:
	_hud.set_score_label(_score)
	_hud.set_lives_label(_lives)

func _on_deathzone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_player_took_damage() -> void:
	_player_hit_sound.play()
	_lives -= 1
	_hud.set_lives_label(_lives)
	
	if -_lives == 0:
		_player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over = _game_over_scene.instantiate()
		game_over.set_score_label(_score)
		_ui.add_child(game_over)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	add_child(enemy_instance)
	enemy_instance.died.connect(_on_enemy_died)

func _on_enemy_died() -> void:
	_score += 100
	_hud.set_score_label(_score)
	_enemy_hit_sound.play()
	
