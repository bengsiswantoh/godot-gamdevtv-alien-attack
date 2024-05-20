extends Control

@export var _score: Label
@export var _lives: Label

func set_score_label(new_score: int) -> void:
	_score.text = 'SCORE: ' + str(new_score)

func set_lives_label(amount: int) -> void:
	_lives.text = str(amount)
