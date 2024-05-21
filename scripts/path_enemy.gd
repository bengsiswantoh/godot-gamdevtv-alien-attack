extends Path2D

@export var _path_follow: PathFollow2D
@export var enemy: Area2D

func _ready() -> void:
	_path_follow.progress_ratio = 1
	
func _process(delta: float) -> void:
	_path_follow.progress_ratio -= 0.25 * delta
	if _path_follow.progress_ratio <= 0:
		queue_free()
		
