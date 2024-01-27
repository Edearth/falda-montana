extends Node2D

const DISTANCE_TO_DELETE: float = 1000

func _ready():
	Global.rock_manager = self

func _process(_delta):
	for child in get_children():
		if child.position.y > 1000:
			child.queue_free()
