extends CanvasLayer

# Variáveis de controle da animação
var altura_ecra: float
var animando: bool = false

# SoundFX
@onready var musica_fundo = $"../MusicaPrincipal"

# O menu começa invisível
func _ready():
	musica_fundo.volume_db = -10
	hide()
	altura_ecra = get_viewport().get_visible_rect().size.y

# Detecta se o jogador apertou a tecla de pausa (ESC por padrão)
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and not animando:
		# Verifica se o jogo está pausado por OUTRO menu (jogo pausado, mas este menu invisível)
		if get_tree().paused and not visible:
			return # Ignora o input e deixa o outro menu lidar com ele
			
		# Informa à engine que este input já foi processado (evita conflitos com outros scripts)
		get_viewport().set_input_as_handled()
		
		alternar_pausa()

func alternar_pausa():
	
	animando = true
	var esta_pausado = get_tree().paused
	
	if not esta_pausado:
		musica_fundo.volume_db = -20
		get_tree().paused = true
		show()
		
		offset.y = altura_ecra 
		
		var tween = create_tween()

		tween.tween_property(self, "offset:y", 0.0, 0.3).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		
		await tween.finished
		animando = false
		
	else:
		musica_fundo.volume_db = -10
		var tween = create_tween()
		tween.tween_property(self, "offset:y", altura_ecra, 0.3).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
		
		await tween.finished
		hide()
		get_tree().paused = false
		animando = false

# Ao pressionar o botão de continuar
func _on_button_continuar_pressed() -> void:
	if not animando:
		alternar_pausa()
	
# Ao pressionar o botão de sair
func _on_button_sair_pressed() -> void:
	get_tree().quit()
