extends Area2D

signal on_player_entered

func _on_body_entered(body):
	if body.is_in_group("player"):
		on_player_entered.emit()
