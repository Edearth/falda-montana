extends StaticBody2D

func hit(_position: Vector2, _normal: Vector2):
	get_parent().hit()
