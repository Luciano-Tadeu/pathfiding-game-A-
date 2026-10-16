extends Node2D
@onready var mapa: TileMapLayer = $TileMapLayer_Game

# Test
func _ready() -> void:
	var _fila := FilaPrioridade.new()
	var estado := Estado.new(null, Vector2i(0, 0))

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


	# print(estado)
	estado = AEstrela.astar(matrix)
	print(estado)
	var caminho = AEstrela.reconstruir_caminho(estado)
	print(caminho)
