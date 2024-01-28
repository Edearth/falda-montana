@tool
extends StaticBody2D
class_name BushController

func _get_configuration_warnings():
	if not get_parent() is BushManager:
		return ["Este nodo espera un parent de tipo BushManager. No hace nada si no tiene parent."]
	return []

func hit(_position: Vector2, _normal: Vector2):
	get_parent().hit()
