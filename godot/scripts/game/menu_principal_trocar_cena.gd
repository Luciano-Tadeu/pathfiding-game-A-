extends CanvasLayer

# Caminho da cena para onde o jogo vai ao clicar
@export_file("*.tscn") var proxima_cena: String = "res://cenas/Ambiente.tscn"

var trocando_cena: bool = false

# No script do Menu_Principal.gd
func _ready():
	get_tree().paused = false
	trocando_cena = false

func _input(event):
	# Evita múltiplos cliques seguidos enquanto a cena carrega
	if trocando_cena:
		return

	# Detecta clique do botão esquerdo do mouse (PC)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		carregar_proxima_cena()
		
	# Detecta toque na tela (Mobile)
	elif event is InputEventScreenTouch and event.pressed:
		carregar_proxima_cena()

func carregar_proxima_cena():
	trocando_cena = true
	get_tree().change_scene_to_file(proxima_cena)
