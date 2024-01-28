extends Control

const DIALOGUES = {
	0: "Hola bbsita no te pongas tristona reina",
	1: "Voy a contarte unos chistecitos xra k te rias un poco gatita jeje",
}
const JOKES = [
	"¿Cómo se emborrachan los pingüinos? Con Licor del Polo.",
	"¿Qué guarda Darth Vader en su nevera? Helado oscuro.",
	"¿Sabías que en en Hawái no te hospedan?: te alohan.",
	"¿Qué pasa si tiras un pato al agua? Nada.",
	"Un policía me detuvo y me dijo 'papeles'? y yo le dije ¡Tijeras! y me disparó 22 veces en los pulmones",
	"¿Qué le dice un jardinero a otro? Seamos felices mientras podamos.",
	"¿Cómo queda un mago después de comer? Magordito.",
	"¿Qué le dice una impresora a otra? ¿Esa hoja es tuya o es impresión mía?"
]
var jokes_index := -1
var current_joke_index = -1

func _input(event):
	if jokes_index != -1 \
		and event is InputEventMouseButton and event.pressed \
		and get_node_or_null("Label") != null:
		jokes_index += 1
		var max_jokes = 5
		if jokes_index == 1:
			$Label.text = DIALOGUES[1]
		elif max_jokes > jokes_index:
			var selected = randi() % JOKES.size()
			var current_joke = get_random_joke()
			$Label.text = current_joke
		else:
			$Label.text = "Estos son los chistes, espero que te hayan gustado gatita"

func get_random_joke():
	var selected = randi() % JOKES.size()
	if selected == current_joke_index:
		get_random_joke()
	else:
		current_joke_index = selected
		return JOKES[current_joke_index]

func _on_game_finish_game_finished():
	jokes_index = 0
	$Label.visible = true
	$Label.text = DIALOGUES[0]
