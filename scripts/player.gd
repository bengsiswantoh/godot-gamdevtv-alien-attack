extends CharacterBody2D

@export var _speed: float = 120
@export var _rocker_container: Node

var _rocket_scene = preload("res://scenes/rocket.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		_shoot()
	
func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * _speed
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2.ZERO, screen_size)

func _shoot() -> void:
	var rocket_instance = _rocket_scene.instantiate()
	_rocker_container.add_child(rocket_instance)
	
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
