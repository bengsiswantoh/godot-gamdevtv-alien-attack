extends Area2D

@export var _speed: float = 120
@export var _visible_notifier: VisibleOnScreenNotifier2D

func _ready() -> void:
	_visible_notifier.screen_exited.connect(_on_screen_exited)

func _physics_process(delta: float) -> void:
	global_position.x += _speed * delta

func _on_screen_exited() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.die()
