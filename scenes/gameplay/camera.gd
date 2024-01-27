extends Camera2D

@onready var player_character = $"../PlayerCharacter"

func _process(delta):
	if player_character.get_position().y < position.y - 100:
		position.y = player_character.get_position().y + 100
	elif player_character.get_position().y > position.y + 300:
		position.y = player_character.get_position().y - 300
