extends TileMapLayer

@export var limite_min: Vector2i = Vector2i(7, 3)
@export var limite_max: Vector2i = Vector2i(12, 8)

var mapa: Array[Dictionary] = [
	
];

var blocos_disponiveis = [
	{"source": 0, "atlas": Vector2i(1, 5), "peso": 30}, # GRAMA 1
	{"source": 0, "atlas": Vector2i(2, 5), "peso": 30}, # GRAMA 2
	{"source": 1, "atlas": Vector2i(8, 6), "peso": 20}, # MORRO
	{"source": 10, "atlas": Vector2i(0, 0), "peso": 20}  # ÁGUA
]

func _ready():
	randomize() 
	gerar_mapa_aleatorio()

func gerar_mapa_aleatorio():
	mapa.clear();
	# Loop que passa por todos os X e Y dentro da sua área 6x6
	for x in range(limite_min.x, limite_max.x + 1):
		for y in range(limite_min.y, limite_max.y + 1):
			var coordenada_atual = Vector2i(x, y);
				
			# Escolhe um bloco aleatório da nossa lista
			var tile_sorteado = sortear_bloco()
			
			# Desenha o bloco no mapa!
			set_cell(coordenada_atual, tile_sorteado["source"], tile_sorteado["atlas"])
			
			# Salva o bloco no vetor
			mapa.append({
				"pos": Vector2i(x - limite_min.x, y - limite_min.y),
				"source": tile_sorteado["source"],
				"atlas": tile_sorteado["atlas"]
			});
			

func sortear_bloco() -> Dictionary:
	var soma_pesos = 0
	
	# 1. Soma todos os pesos
	for bloco in blocos_disponiveis:
		soma_pesos += bloco["peso"]
		
	# 2. Sorteia um número de 0 até o total de pesos
	var numero_sorteado = randi() % soma_pesos 
	
	# 3. Descobre em qual "fatia da pizza" o número caiu
	var peso_acumulado = 0
	for bloco in blocos_disponiveis:
		peso_acumulado += bloco["peso"]
		if numero_sorteado < peso_acumulado:
			return bloco # Retorna o bloco que ganhou
			
	# Retorno de segurança
	return blocos_disponiveis[0]
