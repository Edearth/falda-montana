@tool
extends Node2D
class_name BushManager

func _get_configuration_warnings():
	for child in get_children():
		if child is BushController:
			return []
	return ["Este nodo espera que que tengas nodos hijos de tipo Bush. No hace nada si está vacío"]

func hit():
	for child in get_children():
		if child.has_method("hit_indirect"):
			child.hit_indirect()
	await get_tree().create_timer(.3).timeout
	queue_free()
