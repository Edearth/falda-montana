extends Control

const DIALOGUES = {
	0: "Hola bbsita no te pongas tristona reina",
	1: "Voy a contarte unos chistecitos xra k te rias un poco gatita jeje",
}
var jokes = [
	"¿Cómo se emborrachan los pingüinos? Con Licor del Polo.",
	"¿Qué guarda Darth Vader en su nevera? Helado oscuro.",
	"¿Sabías que en en Hawái no te hospedan?: te alohan.",
	"¿Qué pasa si tiras un pato al agua? Nada.",
	"Un policía me detuvo y me dijo 'papeles'? y yo le dije ¡Tijeras! y me disparó 22 veces en los pulmones",
	"¿Qué le dice un jardinero a otro? Seamos felices mientras podamos.",
	"¿Cómo queda un mago después de comer? Magordito.",
	"¿Qué le dice una impresora a otra? ¿Esa hoja es tuya o es impresión mía?"
]
var jokes_used = []
var jokes_index := -1

func _input(event):
	if jokes_index != -1 \
		and event is InputEventMouseButton and event.pressed \
		and get_node_or_null("Label") != null:
		jokes_index += 1
		var max_jokes = Global.jokes_collected + 2
		if jokes_index == 1:
			$Label.text = DIALOGUES[1]
		elif max_jokes > jokes_index:
			jokes_used = jokes.duplicate()
			jokes.shuffle()
			var current_joke = jokes.pop_front()
			print(current_joke)
			$Label.text = current_joke
		else:
			$Label.text = "He encontrado " + str(Global.jokes_collected) \
				+ " chistecito, espero que te hayan gustado gatita!!"

func _on_game_finish_game_finished():
	jokes_index = 0
	visible = true
	$Label.text = DIALOGUES[0]
