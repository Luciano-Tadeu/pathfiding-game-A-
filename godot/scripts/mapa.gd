extends Node2D

# Test
func _ready() -> void:
	var _fila := FilaPrioridade.new()
	var estado := Estado.new()

	estado.posicao = Vector2i(5, 1)

	var mapa := [
			[3, 1, 2, 1, 1, 3],
			[1, 2, 1, 3, 3, 1],
			[1, 3, 1, 1, 2, 1],
			[1, 1, 2, 1, 1, 1],
			[1, 2, 1, 3, 1, 1],
			[1, 1, 2, 1, 3, 3]
	]

	print(estado.acoes(mapa))
