extends CharacterBody2D

@export var gravity: float = 75
@export var max_bounce: float = 1.6
@export var min_bounce: float = 0.9

var speed: float = 10

func _physics_process(delta):
	velocity.y += delta * gravity
	var collision = move_and_collide(velocity * delta * speed)
	if collision:
		var bounce_magnitude = velocity.bounce(collision.get_normal()).length()
		var lerped_bounce = lerpf(max_bounce, min_bounce, bounce_magnitude / 100)
		if (collision.get_collider() as Node).is_in_group("bottom_floor"):
			lerped_bounce = 1
			if velocity.y > 100:
				lerped_bounce = .5
			elif velocity.y < 30:
				lerped_bounce = 2
			
		if (collision.get_collider() as Node).is_in_group("walls"):
			lerped_bounce = .5
		velocity = velocity.bounce(collision.get_normal()) * lerped_bounce
		update_sprites()
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
		
	if velocity.y > 0:
		$Sprite2D.set_fall_sprite(velocity.y)

func update_sprites():
	$Sprite2D.update_sprites()
