extends RigidBody2D

signal rock_starts_falling
signal rock_destroyed

@export var TIME_TO_START_FALLING: float = 2.0

func _ready():
	angular_velocity = randf_range(-30, 30)
	var warning: CPUParticles2D = $WarningParticles
	warning.restart()
	warning.call_deferred("reparent", get_tree().root)
	freeze = true
	var launch_rock = get_tree().create_timer(TIME_TO_START_FALLING)
	launch_rock.timeout.connect(do_launch_rock)
	warning.finished.connect(warning.queue_free)

func do_launch_rock():
	reparent(Global.rock_manager)
	set_freeze_enabled(false)
	rock_starts_falling.emit()

func _physics_process(_delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("trampoline"):
			Global.a_rock_was_destroyed.emit()
			rock_destroyed.emit()
			body.queue_free()
			queue_free()
