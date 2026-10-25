class_name DataStats

## Três Heurísticas
enum Tipos {
	MANHATTAN,
	EUCLIDIANA,
	CHEBYSHEV
}

var tipo: Tipos
var nos_enfileirados: int = 0
var tempo_inicio := 0
var tamanho_caminho := 0
var custo_energia := 0
var nos_expandidos := 0
var nos_visitados := 0
var tempo_fim := 0
var tempo_computacao: float = 0

func _init(_tipo: Tipos) -> void:
	tipo = _tipo

func _to_string() -> String:
	return str({"tipo": str(Tipos.keys()[tipo]), "enfileirados": float(nos_enfileirados) / AEstrela.execucao, "expandidos": float(nos_expandidos) / AEstrela.execucao, "visitados": float(nos_visitados) / AEstrela.execucao, "tamanho": float(tamanho_caminho) / AEstrela.execucao, "custo": float(custo_energia) / AEstrela.execucao, "tempo": tempo_computacao / AEstrela.execucao})
