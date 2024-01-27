extends Sprite2D

const JUMPS := [
	"res://assets/zarigueya/main_salto.png",
	"res://assets/zarigueya/culo_salto.png",
	"res://assets/zarigueya/mano_salto.png",
]
const FALLS := [
	"res://assets/zarigueya/main_caida.png",
	"res://assets/zarigueya/susto_caida.png"
]

var current_texture_index = 0

func update_sprites():
	var selected = randi() % JUMPS.size()
	if selected == current_texture_index:
		update_sprites()
	else:
		current_texture_index = selected
		texture = load(JUMPS[selected])

func set_fall_sprite(velocity_y: float):
	var selected_sprite = 0
	if velocity_y > 45:
		selected_sprite = 1
	texture = load(FALLS[selected_sprite])
