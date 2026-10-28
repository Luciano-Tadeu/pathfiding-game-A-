extends TileMapLayer

var mapa: Array[Dictionary] = [];
var areaPlayer: Vector2i = Vector2i(3, 3);
var areaAstar: Vector2i = Vector2i(11, 3);

func _ready() -> void:
	mapa = GameData.mapa;
	cloneMap(areaPlayer);
	cloneMap(areaAstar);

func cloneMap(destiny: Vector2i) -> void:
	for tile in mapa:
		set_cell(destiny + tile.pos, tile.source, tile.atlas)
