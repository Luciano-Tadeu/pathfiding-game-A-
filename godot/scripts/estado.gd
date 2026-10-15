class_name Estado

var posicao: Vector2i ## (x, y)
var pai: Estado ## predecessor 𝜋

var g := 0 ## custo do caminho g(v)
var h := 0 ## heurística h(v) => Manhattan

var f: int: ## prioridade (f(v) = g(v) + h(v))
	get():
		return g + h

func acoes(matriz: Array) -> Array[Vector2i]:
	var _adj: Array[Vector2i] = [Vector2i(0, -1), Vector2i(0, 1), Vector2i(-1, 0), Vector2i(1, 0)]
	var res: Array[Vector2i] = []
	
	for direcao in _adj:
		var nova_pos := posicao + direcao
		
		if (nova_pos.x >= 0 and nova_pos.x < matriz[0].size()) \
		and (nova_pos.y >= 0 and nova_pos.y < matriz.size()):
			res.append(nova_pos)

	return res

## Mostrar no print()
func _to_string() -> String:
	return "{0} g:{1} h:{2} f:{3}".format([posicao, g, h, f])
