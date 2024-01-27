extends Node2D

signal game_finished

@onready var player_character = $"../PlayerCharacter"
var is_game_finished := false

func _process(delta):
	if is_game_finished:
		return
	if player_character.position.y < position.y - 100:
		$StaticBody2D.position.x = 300
		game_finished.emit()
