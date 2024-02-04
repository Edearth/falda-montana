extends Node2D

signal game_finished

@onready var player_character = $"../PlayerCharacter"

var final_cinematic = preload("res://scenes/finial_cinematic/final_cinematic.tscn").instantiate()
var is_game_finished := false

func _process(_delta):
	if is_game_finished:
		return
	if player_character.position.y < position.y - 100 and !is_game_finished:
		$StaticBody2D.position.x = 300
		game_finished.emit()
		$AudioStreamPlayer.play()
		var tween = create_tween()
		tween.tween_property($Sprite2D, "modulate:a", 1, .5)
		await tween.finished
		#await get_tree().create_timer(.5)
		get_tree().change_scene_to_file("res://scenes/finial_cinematic/final_cinematic.tscn")
		queue_free()
