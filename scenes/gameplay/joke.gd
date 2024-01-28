extends Node2D

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		Global.jokes_collected += 1
		queue_free()
