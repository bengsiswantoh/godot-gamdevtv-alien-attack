extends Control

@export var _score: Label

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func set_score_label(new_score: int) -> void:
	_score.text = 'SCORE: ' + str(new_score)
