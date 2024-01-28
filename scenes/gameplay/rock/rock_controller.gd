extends RigidBody2D


func _ready():
	angular_velocity = randf_range(-30, 30)
	var warning: CPUParticles2D = $WarningParticles
	warning.restart()
	warning.reparent(get_tree().root)
	freeze = true
	var launch_rock = get_tree().create_timer(2)
	launch_rock.timeout.connect(set_freeze_enabled.bind(false))
	warning.finished.connect(warning.queue_free)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("trampoline"):
			body.queue_free()
			queue_free()
