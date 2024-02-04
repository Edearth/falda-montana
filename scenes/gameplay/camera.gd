extends Camera2D

@onready var player_character = $"../PlayerCharacter"

func _process(_delta):
	if player_character.get_position().y < position.y - 100:
		position.y = player_character.get_position().y + 100
	elif player_character.get_position().y > position.y + 200:
		position.y = player_character.get_position().y - 200
		if position.y >= 400:
			position.y = 400
