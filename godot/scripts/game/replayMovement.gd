extends Node2D
# Variáveis de controle
@export var tamanho_tile: int = 16
@export var tempo_movimento: float = 0.5

# Define as coordenadas iniciais e finais do grid
@export var limite_min: Vector2i
@export var limite_max: Vector2i
@export var coordenada_saida: Vector2i

# Animações e Sistema de Energia
@onready var sprite = $"AnimatedSprite2D"
@onready var mapa : TileMapLayer = $"../TileMapLayer_Game"
var texto_energia: Label
var playerMovimentos: Array;
var energia_gasta: int = 0 
var historico_energia: Array = []

enum TipoPersonagem {PLAYER, ROBO};
@export var tipoPersonagem: TipoPersonagem

# Flags de Inicio e Fim
var started = false
var finished = false
signal finish(tipoPersonagem: TipoPersonagem);
@export var inicio: Vector2i
@export var fim: Vector2i

# Para guardar a movimentação do player
@export var posicao_grid: Vector2i
var movimentoAtual = 0;
var movendo: bool = false

# SoundFX
@onready var som_passo = $Sound_Passo
@onready var som_inicio = $Sound_Inicio
@onready var som_vitoria = $Sound_Vitoria

func _ready():
	# Converte a posição atual em píxeis para a posição no grid
	posicao_grid = Vector2i(position) / tamanho_tile
	atualizar_painel_energia()
	
	if (tipoPersonagem == TipoPersonagem.PLAYER):
		playerMovimentos = GameData.player_historico;
		texto_energia = $"../PlayerEnergy/BoxContainer/Label"
	else:
		playerMovimentos = GameData.astar_historico;
		texto_energia = $"../AstarEnergy/BoxContainer/Label"
	
	# Centraliza perfeitamente o jogador no bloco ao iniciar
	position = Vector2(posicao_grid) * tamanho_tile + Vector2(tamanho_tile / 2.0, tamanho_tile / 2.0)
	
func _process(delta: float) -> void:
	# Ignora os comandos se o jogador ainda estiver no meio de um movimento
	if movendo || movimentoAtual >= playerMovimentos.size():
		return
		
	var direcao = playerMovimentos[movimentoAtual];
		
	if direcao != Vector2i.ZERO:
		tentar_mover(direcao)

func tentar_mover(direcao: Vector2i):
	var nova_posicao_grid = posicao_grid + direcao
	
	# Caso Finalizado o jogo não se move
	if finished == true:
		return
	
	# Primeiro movimento de START
	if nova_posicao_grid.x == inicio.x and nova_posicao_grid.y == inicio.y:
		if started == false:  
			started = true
			posicao_grid = nova_posicao_grid + direcao
			
			var tile_data = mapa.get_cell_tile_data(posicao_grid)
			
			if tile_data:
				var custo = tile_data.get_custom_data('custo_energia')
				energia_gasta += custo
				historico_energia.append(energia_gasta)
				atualizar_painel_energia()
				
			sprite.play("Up")
			tempo_movimento = 1.0
			som_inicio.play()
			deslizar_para_novo_bloco()
			tempo_movimento = 0.5
			return
	
	# Último movimento de FINISH
	if nova_posicao_grid.x == fim.x and nova_posicao_grid.y == fim.y:
		finished = true  
		posicao_grid = nova_posicao_grid + direcao
		sprite.play("Up")
		tempo_movimento = 1.0
		som_vitoria.play()
		deslizar_para_novo_bloco()
		tempo_movimento = 0.5
		return
	
	# Movimento dentro do Grid 6x6
	if nova_posicao_grid.x >= limite_min.x and nova_posicao_grid.x <= limite_max.x:
		if nova_posicao_grid.y >= limite_min.y and nova_posicao_grid.y <= limite_max.y:
			var tile_data = mapa.get_cell_tile_data(nova_posicao_grid)
			
			# Sistema de Energia
			if tile_data:
				var custo = tile_data.get_custom_data('custo_energia')
				energia_gasta += custo
				historico_energia.append(energia_gasta)
				atualizar_painel_energia()
				
			# Dispara as animações
			match direcao:
				Vector2i.RIGHT:
					sprite.play("Right")
				Vector2i.LEFT:
					sprite.play("Left")
				Vector2i.DOWN:
					sprite.play("Down")
				Vector2i.UP:
					sprite.play("Up")
			som_passo.play()
			
			posicao_grid = nova_posicao_grid
			deslizar_para_novo_bloco()

# Função que Movimenta o personagem no Grid 6x6
func deslizar_para_novo_bloco():
	movendo = true
	
	# Calcula o centro em píxeis do próximo bloco
	var posicao_destino = Vector2(posicao_grid) * tamanho_tile + Vector2(tamanho_tile / 2.0, tamanho_tile / 2.0)
	
	# Usa um Tween para animar o movimento de forma fluida
	var tween = create_tween()
	tween.tween_property(self, "position", posicao_destino, tempo_movimento)
	
	# Espera a animação acabar para permitir um novo movimento
	await tween.finished
	sprite.pause()
	movendo = false
	movimentoAtual += 1;
	
	# --- VERIFICAÇÃO DE VITÓRIA ---
	if posicao_grid == coordenada_saida:
		finish.emit(tipoPersonagem)

# Atualizar no painel a Energia Gasta
func atualizar_painel_energia():
	if texto_energia:
		var novo_texto = str(energia_gasta)
		texto_energia.text = novo_texto
