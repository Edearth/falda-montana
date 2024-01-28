extends RigidBody2D


func _ready():
	angular_velocity = randf_range(-30, 30)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("trampoline"):
			body.queue_free()
			queue_free()
