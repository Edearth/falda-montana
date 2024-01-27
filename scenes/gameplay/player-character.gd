extends CharacterBody2D

@export var gravity: float = 75
@export var max_bounce: float = 2
@export var min_bounce: float = 1
var speed: float = 10

func _physics_process(delta):
	velocity.y += delta * gravity
	var collision = move_and_collide(velocity * delta * speed)
	if collision:
		var bounce_magnitude = velocity.bounce(collision.get_normal()).length()
		print(bounce_magnitude / 100)
		var a = lerpf(max_bounce, min_bounce, bounce_magnitude / 100)
		velocity = velocity.bounce(collision.get_normal()) * a