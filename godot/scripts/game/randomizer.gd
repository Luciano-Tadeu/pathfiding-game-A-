extends TileMapLayer

@export var limite_min: Vector2i = Vector2i(7, 3)
@export var limite_max: Vector2i = Vector2i(12, 8)
@export var ponto_inicio: Vector2i = Vector2i(12, 3)
@export var ponto_fim: Vector2i = Vector2i(7, 8)
@export var max_tentativas: int = 50

var mapa: Array[Dictionary] = []

var blocos_disponiveis = [
	{"source": 0, "atlas": Vector2i(1, 5), "peso": 25},  # GRAMA 1
	{"source": 0, "atlas": Vector2i(2, 5), "peso":25},  # GRAMA 2
	{"source": 1, "atlas": Vector2i(8, 6), "peso": 15},  # MORRO
	{"source": 10, "atlas": Vector2i(0, 0), "peso": 10}, # ÁGUA
	{"source": 15, "atlas": Vector2i(0, 0), "peso": 8}   # RAIO
]

func _ready():
	randomize()
	gerar_mapa_aleatorio()

func dentro_do_mapa(p: Vector2i) -> bool:
	return p.x >= limite_min.x and p.x <= limite_max.x \
		and p.y >= limite_min.y and p.y <= limite_max.y

func limpar_area():
	# Reseta TODA a área para grama antes de cada tentativa
	for x in range(limite_min.x, limite_max.x + 1):
		for y in range(limite_min.y, limite_max.y + 1):
			var grama = blocos_disponiveis[randi() % 2] # grama 1 ou 2
			set_cell(Vector2i(x, y), grama["source"], grama["atlas"])

func gerar_mapa_aleatorio():
	for tentativa in range(max_tentativas):
		construir_mapa()
		if validar_caminho():
			salvar_mapa()
			return

	# Fallback: nenhuma tentativa deu certo, gera mapa sem muros
	push_warning("Não achou mapa válido em %d tentativas. Gerando sem muros." % max_tentativas)
	construir_mapa(0)
	salvar_mapa()

func construir_mapa(quantidade_muros: int = 5):
	limpar_area()

	# Muros
	for i in range(quantidade_muros):
		var px = randi_range(limite_min.x, limite_max.x)
		var py = randi_range(limite_min.y, limite_max.y)
		var direcao = [Vector2i.RIGHT, Vector2i.DOWN, Vector2i.LEFT, Vector2i.UP].pick_random()
		var tamanho_muro = randi_range(2, 3)

		for passo in range(tamanho_muro):
			var pos_muro = Vector2i(px, py) + (direcao * passo)
			if dentro_do_mapa(pos_muro) and pos_muro != ponto_inicio and pos_muro != ponto_fim:
				set_cell(pos_muro, 9, Vector2i(0, 0))

	# Água, morro, raio (só em cima de grama, nunca no início/fim)
	for x in range(limite_min.x, limite_max.x + 1):
		for y in range(limite_min.y, limite_max.y + 1):
			var pos = Vector2i(x, y)
			if get_cell_source_id(pos) == 0 and pos != ponto_inicio and pos != ponto_fim:
				var b = sortear_bloco()
				set_cell(pos, b["source"], b["atlas"])

func salvar_mapa():
	mapa.clear()
	for x in range(limite_min.x, limite_max.x + 1):
		for y in range(limite_min.y, limite_max.y + 1):
			var pos = Vector2i(x, y)
			mapa.append({
				"pos": Vector2i(x - limite_min.x, y - limite_min.y),
				"source": get_cell_source_id(pos),
				"atlas": get_cell_atlas_coords(pos)
			})

func validar_caminho() -> bool:
	var visitados := {}
	var fila: Array[Vector2i] = [ponto_inicio]
	visitados[ponto_inicio] = true

	while fila.size() > 0:
		var atual = fila.pop_front()

		if atual == ponto_fim:
			return true

		for dir in [Vector2i.RIGHT, Vector2i.LEFT, Vector2i.UP, Vector2i.DOWN]:
			var vizinho = atual + dir
			if not dentro_do_mapa(vizinho) or visitados.has(vizinho):
				continue
			if get_cell_source_id(vizinho) == 9:
				continue
			visitados[vizinho] = true
			fila.append(vizinho)

	return false

func sortear_bloco() -> Dictionary:
	var soma_pesos = 0
	for bloco in blocos_disponiveis:
		soma_pesos += bloco["peso"]

	var numero_sorteado = randi() % soma_pesos
	var peso_acumulado = 0
	for bloco in blocos_disponiveis:
		peso_acumulado += bloco["peso"]
		if numero_sorteado < peso_acumulado:
			return bloco

	return blocos_disponiveis[0]
