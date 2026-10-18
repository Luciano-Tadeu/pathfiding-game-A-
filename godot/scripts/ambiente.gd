extends Node2D
@onready var mapa: TileMapLayer = $"Gameplay/TileMapLayer_Game"

var limite_min: Vector2i = Vector2i(7, 3)

# Test
func _ready() -> void:
	var _fila := FilaPrioridade.new()

	var matrix := [
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
	]

	for y in range(matrix.size()):
		for x in range(matrix[0].size()):
			var pos: Vector2i = mapa.limite_min + Vector2i(x, y)
			var celula := mapa.get_cell_tile_data(pos)
			if celula:
				var custo = celula.get_custom_data('custo_energia')
				matrix[y][x] = custo
	# print(matrix)

	var res := AEstrela.astar(matrix)
	var estado: Estado = res["estado"]
	var stats: Dictionary = res["stats"]

	print(estado)
	var caminho := AEstrela.reconstruir_caminho(estado)
	stats["tamanho_caminho"] = caminho.size()
	print(caminho)
	
	var custo: Array[int] = []
	
	GameData.astar_historico.clear();
	
	GameData.astar_historico.append(Vector2i(0, -1));
	custo.append(mapa.get_cell_tile_data(limite_min + Vector2i(0, 5)).get_custom_data("custo_energia"));
	for i in range(1, caminho.size()):
		GameData.astar_historico.append(caminho[i] - caminho[i - 1]);
		custo.append(custo[i - 1] + mapa.get_cell_tile_data(limite_min + caminho[i]).get_custom_data("custo_energia"));
	GameData.astar_historico.append(Vector2i(0, -1));
	
	GameData.astar_custo = custo.duplicate(true);

	print(res["stats"])
