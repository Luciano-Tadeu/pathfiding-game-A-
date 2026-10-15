extends CanvasLayer

var altura_ecra: float

# SoundFX
@onready var musica_fundo = $"../MusicaPrincipal"

func _ready() -> void:
	hide()
	altura_ecra = get_viewport().get_visible_rect().size.y

func _on_button_sair_pressed() -> void:
	get_tree().quit()


func _on_button_reiniciar_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_player_finish(energy_cost: Variant) -> void:
	show()
	get_tree().paused = true
	offset.y = altura_ecra 
	musica_fundo.volume_db = -20
	var tween = create_tween()

	tween.tween_property(self, "offset:y", 0.0, 0.3).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	
	await tween.finished
