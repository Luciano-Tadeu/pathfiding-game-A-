class_name AEstrela

static var stats: Array[DataStats] = [
	DataStats.new(DataStats.Tipos.MANHATTAN),
	DataStats.new(DataStats.Tipos.EUCLIDIANA),
	DataStats.new(DataStats.Tipos.CHEBYSHEV)
]

static var execucao := 0

static func astar(matriz: Array, tipo := 0, entrada := Vector2i(0, 5), saida := Vector2i(5, 0)) -> Dictionary:
	# stats[tipo] = DataStats.new(tipo)

	stats[tipo].tempo_inicio = Time.get_ticks_usec()


	var Q := FilaPrioridade.new()
	var visitada := {}
	var g_values := {}

	var start := Estado.new(null, entrada)
	start.g = matriz[entrada.y][entrada.x]
	start.h = start.manhattan(entrada, saida)

	if (tipo == 0):
		start.manhattan(entrada, saida)
	elif tipo == 1:
		start.euclidiana(entrada, saida)
	else:
		start.chebyshev(entrada, saida)

	g_values[entrada] = start.g # Inicializar custo do estado entrada

	Q.enfileirar(start, start.f)
	stats[tipo].nos_enfileirados += 1

	while Q.contar > 0: # verifica se Q está vazia
		var v: Estado = Q.desenfileirar()

		if v.posicao in visitada:
			continue

		stats[tipo].nos_expandidos += 1
		visitada[v.posicao] = true
		stats[tipo].nos_visitados += 1

		if v.posicao == saida:
			stats[tipo].custo_energia += v.g
			stats[tipo].tempo_fim = Time.get_ticks_usec()
			stats[tipo].tempo_computacao += stats[tipo].tempo_fim - stats[tipo].tempo_inicio
			return {"estado": v, "stats": stats[tipo]}

		for u in v.vizinhos(matriz):
			var novo_g: int = g_values[v.posicao] + matriz[u.y][u.x] # Custo do novo caminho (g(n))

			if u not in g_values or novo_g < g_values[u]:
				g_values[u] = novo_g
				var filho := Estado.new(v, u)
				filho.g = novo_g

				if (tipo == 0):
					filho.h = filho.manhattan(u, saida)
				elif tipo == 1:
					filho.h = filho.euclidiana(u, saida)
				else:
					filho.h = filho.chebyshev(u, saida)

				Q.enfileirar(filho, filho.f)
				stats[tipo].nos_enfileirados += 1

	stats[tipo].tempo_fim = Time.get_ticks_usec()
	stats[tipo].tempo_computacao += stats[tipo].tempo_fim - stats[tipo].tempo_inicio
	return {"estado": null, "stats": stats[tipo]}

static func reconstruir_caminho(estado_final: Estado) -> Array[Vector2i]:
	var caminho: Array[Vector2i] = []
	var atual: Estado = estado_final

	while atual != null:
		caminho.append(atual.posicao)
		atual = atual.pai

	caminho.reverse()
	return caminho
