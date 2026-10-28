extends CanvasLayer

@onready var player = $"../Gameplay/Player";

var altura_ecra: float

# SoundFX
@onready var musica_fundo = $"../MusicaPrincipal"

func _ready() -> void:
	hide()
	altura_ecra = get_viewport().get_visible_rect().size.y
	player.finish.connect(_on_player_finish);

func _on_button_sair_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://cenas/Menu_Principal.tscn")

func _on_button_comparar_pressed() -> void:
	var gameplay = $"../Gameplay";
	
	if (gameplay):
		GameData.mapa = gameplay.get_node("TileMapLayer_Game").mapa.duplicate(true);
		GameData.player_historico = player.caminho_percorrido.duplicate(true);
		gameplay.queue_free();
		
	musica_fundo.volume_db = -10
	 
	var replay = preload("res://cenas/Replay.tscn").instantiate();
	
	get_tree().paused = false
	
	hide();
	
	get_tree().current_scene.add_child(replay);

func _on_button_reiniciar_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_player_finish(_energy_cost: Variant) -> void:
	show()
	get_tree().paused = true
	offset.y = altura_ecra 
	musica_fundo.volume_db = -20
	var tween = create_tween()

	tween.tween_property(self, "offset:y", 0.0, 0.3).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	
	await tween.finished
