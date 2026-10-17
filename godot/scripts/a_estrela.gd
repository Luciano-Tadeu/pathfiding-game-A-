class_name AEstrela


static func astar(matriz: Array, entrada := Vector2i(0, 5), saida := Vector2i(5, 0)) -> Dictionary:
	var stats: Dictionary = {
		"nos_enfileirados": 0,
		"tempo_inicio": Time.get_ticks_usec(),
		"tamanho_caminho": 0,
		"custo_energia": 0,
		"nos_expandidos_visitados": 0,
		# "nos_visitados": 0,
		"tempo_fim": 0,
		"tempo_computacao": 0
	}

	
	var Q := FilaPrioridade.new()
	var visitada := {}
	var g_values := {}

	var start := Estado.new(null, entrada)
	start.g = matriz[entrada.y][entrada.x]
	start.h = start.manhattan(entrada, saida)
	g_values[entrada] = start.g # Inicializar custo do estado entrada

	Q.enfileirar(start, start.f)
	stats["nos_enfileirados"] += 1

	while Q.contar > 0: # verifica se Q está vazia
		var v: Estado = Q.desenfileirar()

		if v.posicao in visitada:
			continue

		stats["nos_expandidos_visitados"] += 1
		visitada[v.posicao] = true
		# stats["nos_visitados"] += 1

		if v.posicao == saida:
			stats["custo_energia"] = v.g
			stats["tempo_fim"] = Time.get_ticks_usec()
			stats["tempo_computacao"] = stats["tempo_fim"] - stats["tempo_inicio"]
			return {"estado": v, "stats": stats}

		for u in v.acoes(matriz):
			var novo_g: int = g_values[v.posicao] + matriz[u.y][u.x] # Custo do novo caminho (g(n))

			if u not in g_values or novo_g < g_values[u]:
				g_values[u] = novo_g
				var filho := Estado.new(v, u)
				filho.g = novo_g
				filho.h = filho.manhattan(u, saida)
				Q.enfileirar(filho, filho.f)
				stats["nos_enfileirados"] += 1

	stats["tempo_fim"] = Time.get_ticks_usec()
	stats["tempo_computacao"] = stats["tempo_fim"] - stats["tempo_inicio"]
	return {"estado": null, "stats": stats}

static func reconstruir_caminho(estado_final: Estado) -> Array[Vector2i]:
	var caminho: Array[Vector2i] = []
	var atual: Estado = estado_final
	
	while atual != null:
		caminho.append(atual.posicao)
		atual = atual.pai
		
	caminho.reverse()
	return caminho
