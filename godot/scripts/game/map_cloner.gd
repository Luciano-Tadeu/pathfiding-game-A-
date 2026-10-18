extends TileMapLayer

var mapa: Array[Dictionary] = [];
var areaPlayer: Vector2i = Vector2i(3, 3);
var areaAstar: Vector2i = Vector2i(11, 3);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mapa = GameData.mapa;
	cloneMap(areaPlayer);
	cloneMap(areaAstar);
	

func cloneMap(destiny: Vector2i, ) -> void:
	for tile in mapa:
		set_cell(destiny + tile.pos, tile.source, tile.atlas)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
