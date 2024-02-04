extends StaticBody2D

func hit(new_position: Vector2, normal: Vector2):
	$Line2D.hit(new_position, normal)
