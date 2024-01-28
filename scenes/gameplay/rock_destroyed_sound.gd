extends AudioStreamPlayer

func _ready():
	Global.a_rock_was_destroyed.connect(play_this)

func play_this():
	play()
