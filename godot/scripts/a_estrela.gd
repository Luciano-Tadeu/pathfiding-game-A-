class_name AEstrela


static func astar(matriz: Array, inicio := Vector2i(0, 5), obj := Vector2i(5, 0)) -> Estado:
	var Q := FilaPrioridade.new()
	var visitada := {}
	var g_values := {}

	var start := Estado.new(null, inicio)
	start.g = matriz[inicio.y][inicio.x]
	start.h = start.manhattan(inicio, obj)
	g_values[inicio] = start.g # Inicializar custo do estado inicial

	Q.enfileirar(start, start.f)

	while Q.contar > 0: # verifica se Q está vazia
		var v: Estado = Q.desenfileirar()

		if v.posicao in visitada:
			continue

		visitada[v.posicao] = true

		if v.posicao == obj:
			return v

		for u in v.acoes(matriz):
			var novo_g: int = g_values[v.posicao] + matriz[u.y][u.x]
			if u not in g_values or novo_g < g_values[u]:
				g_values[u] = novo_g
				var filho := Estado.new(v, u)
				filho.g = novo_g
				filho.h = filho.manhattan(u, obj)
				Q.enfileirar(filho, filho.f)
				# print(filho.posicao)

	return null
