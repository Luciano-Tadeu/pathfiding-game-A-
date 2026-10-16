extends CharacterBody2D
# Variáveis de controle
@export var tamanho_tile: int = 16
@export var tempo_movimento: float = 0.5

# Define as coordenadas iniciais e finais do grid
@export var limite_min: Vector2i = Vector2i(7, 3)
@export var limite_max: Vector2i = Vector2i(12, 8)
@export var coordenada_saida: Vector2i = Vector2i(12, 1)

# Animações e Sistema de Energia
@onready var sprite = $AnimatedSprite2D
@export var mapa : TileMapLayer
@export var texto_energia: RichTextLabel
var energia_gasta: int = 0

# Flags de Inicio e Fim
var started = false
var finished = false
signal finish(energy_cost)

# Para guardar a movimentação do player
var posicao_grid: Vector2i
var movendo: bool = false
var caminho_percorrido = []

# SoundFX
@onready var som_passo = $Sound_Passo
@onready var som_inicio = $Sound_Inicio
@onready var som_vitoria = $Sound_Vitoria

func _ready():
	# Converte a posição atual em píxeis para a posição no grid
	posicao_grid = Vector2i(position) / tamanho_tile
	atualizar_painel_energia()
	
	# Centraliza perfeitamente o jogador no bloco ao iniciar
	position = Vector2(posicao_grid) * tamanho_tile + Vector2(tamanho_tile / 2.0, tamanho_tile / 2.0)

func _unhandled_input(event):
	# Ignora os comandos se o jogador ainda estiver no meio de um movimento
	if movendo:
		return
		
	var direcao = Vector2i.ZERO
	
	if event.is_action_pressed("ui_right"):
		direcao = Vector2i.RIGHT
	elif event.is_action_pressed("ui_left"):
		direcao = Vector2i.LEFT
	elif event.is_action_pressed("ui_down"):
		direcao = Vector2i.DOWN
	elif event.is_action_pressed("ui_up"):
		direcao = Vector2i.UP
		
	if direcao != Vector2i.ZERO:
		tentar_mover(direcao)

func tentar_mover(direcao: Vector2i):
	var nova_posicao_grid = posicao_grid + direcao
	
	# Caso Finalizado o jogo não se move
	if finished == true:
		return
	
	# Primeiro movimento de START
	if nova_posicao_grid.x == 7 and nova_posicao_grid.y == 9:
		if started == false:  
			started = true
			posicao_grid = nova_posicao_grid + direcao
			
			var tile_data = mapa.get_cell_tile_data(posicao_grid)
			
			if tile_data:
				var custo = tile_data.get_custom_data('custo_energia')
				energia_gasta += custo
				atualizar_painel_energia()
				
			caminho_percorrido.append((posicao_grid - Vector2i(7, 3)))
			sprite.play("Up")
			som_inicio.play()
			tempo_movimento = 1.0
			deslizar_para_novo_bloco()
			tempo_movimento = 0.5
			return
	
	# Último movimento de FINISH
	if nova_posicao_grid.x == 12 and nova_posicao_grid.y == 2:
		finished = true  
		posicao_grid = nova_posicao_grid + direcao

		print(caminho_percorrido)
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
				atualizar_painel_energia()
				
			# Dispara as animações
			match direcao:
				Vector2i.RIGHT:
					sprite.play("Right")
					som_passo.play()
				Vector2i.LEFT:
					sprite.play("Left")
					som_passo.play()
				Vector2i.DOWN:
					sprite.play("Down")
					som_passo.play()
				Vector2i.UP:
					sprite.play("Up")
					som_passo.play()
			
			posicao_grid = nova_posicao_grid
			caminho_percorrido.append((posicao_grid - Vector2i(7, 3)))
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
	
	# --- VERIFICAÇÃO DE VITÓRIA ---
	if posicao_grid == coordenada_saida:
		finish.emit(energia_gasta)

# Atualizar no painel a Energia Gasta
func atualizar_painel_energia():
	if texto_energia:
		var novo_texto = "[color=yellow][b]" + str(energia_gasta) + "[/b][/color]\n\n"
		texto_energia.text = novo_texto
