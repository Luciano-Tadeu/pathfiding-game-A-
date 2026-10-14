class_name FilaPrioridade

var contar: int:
    get:
        return nos.size()

## Nós de vetores
var nos: Array[No]

func _init() -> void:
    nos = []

func enfileirar(elemento: Variant, prioridade: Variant) -> void:
    var novo_no := No.new(elemento, prioridade)
    
    for indice in range(nos.size()):
        if prioridade < nos[indice].prioridade:
            nos.insert(indice, novo_no)
            return
    
    nos.append(novo_no)

func desenfileirar() -> Variant:
    if nos.is_empty():
        return null
    
    var aux_no := nos[0]
    nos.remove_at(0)
    
    return aux_no.elemento

func topo() -> Variant:
    if nos.is_empty():
        return null
    
    return nos[0].prioridade

func liberar() -> void:
    nos.clear()