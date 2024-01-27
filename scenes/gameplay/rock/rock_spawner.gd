extends Area2D

@onready var rock_scene: PackedScene = load("res://scenes/gameplay/rock/rock.tscn")
@onready var timer = $Timer
@export var spawn_rocks_on_start: bool = false

func _ready():
	if spawn_rocks_on_start:
		$Timer.start()

func get_random_position_in_spawn_area() -> Vector2:
	var rect: Rect2 = $CollisionShape2D.shape.get_rect()
	var x = randf_range(rect.position.x, rect.position.x + rect.size.x)
	var y = randf_range(rect.position.y, rect.position.y + rect.size.y)
	return Vector2(x,y)

func spawn_rock():
	var instance = rock_scene.instantiate()
	instance.position = get_random_position_in_spawn_area() + self.global_position
	Global.rock_manager.add_child(instance)

func _on_timer_timeout():
	get_random_position_in_spawn_area()
	spawn_rock()

func stop():
	$Timer.stop()

func start():
	$Timer.start(0)
