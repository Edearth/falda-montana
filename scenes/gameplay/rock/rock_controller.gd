extends RigidBody2D

signal rock_destroyed

@export var TIME_TO_START_FALLING: float = 2.0

func _ready():
	angular_velocity = randf_range(-30, 30)
	var warning: CPUParticles2D = $WarningParticles
	warning.restart()
	warning.call_deferred("reparent", get_tree().root)
	freeze = true
	var launch_rock = get_tree().create_timer(TIME_TO_START_FALLING)
	launch_rock.timeout.connect(set_freeze_enabled.bind(false))
	warning.finished.connect(warning.queue_free)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("trampoline"):
			rock_destroyed.emit()
			body.queue_free()
			queue_free()
