extends Node2D
@onready var mapa: TileMapLayer = $"Gameplay/TileMapLayer_Game"

var limite_min: Vector2i = Vector2i(7, 3)

func _ready() -> void:
	var matrix := ler_matriz()
	var caminho_manhattan: Array[Vector2i]

	AEstrela.execucao += 1
	print("\nExecução ", AEstrela.execucao, " (média de ", AEstrela.execucao, "):")
	for i in 3:
		var res := AEstrela.astar(matrix, i)

		var caminho := AEstrela.reconstruir_caminho(res["estado"])
		if i == 0:
			caminho_manhattan = caminho
		
		res["stats"].tamanho_caminho += caminho.size()
		print(DataStats.Tipos.keys()[i], ": ", res["stats"])

	var custo: Array[int] = []
	GameData.astar_historico.clear();

	GameData.astar_historico.append(Vector2i(0, -1));
	custo.append(mapa.get_cell_tile_data(limite_min + Vector2i(0, 5)).get_custom_data("custo_energia"));
	for i in range(1, caminho_manhattan.size()):
		GameData.astar_historico.append(caminho_manhattan[i] - caminho_manhattan[i - 1]);
		custo.append(custo[i - 1] + mapa.get_cell_tile_data(limite_min + caminho_manhattan[i]).get_custom_data("custo_energia"));
	GameData.astar_historico.append(Vector2i(0, -1));

	GameData.astar_custo = custo.duplicate(true);

func ler_matriz() -> Array:
	var m := []
	for y in 6:
		var linha := []
		for x in 6:
			var celula := mapa.get_cell_tile_data(mapa.limite_min + Vector2i(x, y))
			linha.append(celula.get_custom_data("custo_energia") if celula else 0)
		m.append(linha)
	return m
