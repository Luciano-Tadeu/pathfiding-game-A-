extends Node2D
@onready var mapa: TileMapLayer = $TileMapLayer_Game

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

	print(res["stats"])
