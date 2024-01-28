@tool
extends StaticBody2D
class_name BushController

var has_been_hit = false

func _get_configuration_warnings():
	if not get_parent() is BushManager:
		return ["Este nodo espera un parent de tipo BushManager. No hace nada si no tiene parent."]
	return []

func hit(_position: Vector2, _normal: Vector2):
	$AnimationPlayer.play("hit")
	has_been_hit = true
	get_parent().hit()

func hit_indirect():
	if not has_been_hit:
		$AnimationPlayer.play("hit_indirect")
