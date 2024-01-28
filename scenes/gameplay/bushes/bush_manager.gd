@tool
extends Node2D
class_name BushManager

func _get_configuration_warnings():
	for child in get_children():
		if child is BushController:
			return []
	return ["Este nodo espera que que tengas nodos hijos de tipo Bush. No hace nada si está vacío"]

func hit():
	queue_free()
