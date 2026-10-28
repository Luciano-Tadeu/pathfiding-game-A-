extends TextureRect

@export var distancia_balanco: float = 8.0 # Quantos pixels ele sobe/desce
@export var tempo_animacao: float = 2.0   # Tempo em segundos para completar o ciclo

var posicao_original_y: float

func _ready():
	posicao_original_y = position.y
	iniciar_animacao_flutuar()

func iniciar_animacao_flutuar():
	# Cria o Tween em loop infinito
	var tween = create_tween().set_loops()
	
	# Metade do tempo: Sobe suavemente (no Godot, Y negativo é para cima)
	tween.tween_property(self, "position:y", posicao_original_y - distancia_balanco, tempo_animacao / 2.0) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		
	# Outra metade: Desce de volta para a posição original
	tween.tween_property(self, "position:y", posicao_original_y, tempo_animacao / 2.0) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
