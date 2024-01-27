extends Node2D

const TRAMPOLINE = preload("res://scenes/gameplay/trampoline/trampoline.tscn")
var current_trampoline
var is_game_finised := false

func _input(event):
	if event is InputEventMouseButton and !is_game_finised:
		if event.pressed:
			current_trampoline = TRAMPOLINE.instantiate()
			get_tree().root.add_child(current_trampoline)
			current_trampoline.position = get_global_mouse_position()
		else:
			if current_trampoline != null:
				current_trampoline.stop_editing()

func _on_game_finish_game_finished():
	is_game_finised = true
