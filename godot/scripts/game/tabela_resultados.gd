extends Node2D

@onready var tileMap = $"../TileMapLayer"
@onready var tileSize = tileMap.tile_set.tile_size;
@onready var energyLabels = $Energia
@onready var player = $"../../../Gameplay/Player"
var font = preload("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Font/Pixuf.ttf")

# O menu começa em (2, 1)
# O menu termina em (18, 10)

@onready var tableStartOffset = Vector2(5, 3);

@onready var tableEndOffset = Vector2(15, 7);

@onready var tableStart: Vector2 = Vector2(
	tableStartOffset.x * tileSize.x, 
	tableStartOffset.y * tileSize.y
);

@onready var tableEnd: Vector2 = Vector2(
	tableEndOffset.x * tileSize.x,
	tableEndOffset.y * tileSize.y
);

var maxSteps = 0;
var maxEnergy = 0;

var playerSteps: Array = [];
var botSteps: Array = [];

var playerEnergy = 0;
var botEnergy = 0;

var animationSpeed = 0.17;
var scores = [
	{
		"steps": [],
		"segment": 0,
		"progress": 0.0
	},
	{
		"steps": [],
		"segment": 0,
		"progress": 0.0
	}
];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visibility_changed.connect(initiate);
	
func initiate() -> void:
	if visible:
		playerSteps = player.caminho_percorrido.duplicate(true);
		botSteps = GameData.astar_historico.duplicate(true);
		
		playerEnergy = player.historico_energia.duplicate(true);
		botEnergy = GameData.astar_custo.duplicate(true);
		
		maxSteps = max(player.caminho_percorrido.size(), botSteps.size()) - 1;
		maxEnergy = max(playerEnergy.max(), botEnergy.max());
		
		#print("astar: " + str(botEnergy));

		scores[0].steps.resize(maxSteps)
		scores[0].steps.fill(0.0)

		scores[1].steps.resize(maxSteps)
		scores[1].steps.fill(0.0)
		
		var idxEnergy = 1;
		for i in energyLabels.get_children():
			#print(i.name);
			i.text = str(int((maxEnergy) / float(4) * (5 - idxEnergy)));
			idxEnergy += 1;
			
		#print(playerSteps);
		#print(playerEnergy);
			
		_draw();
		animateScore(0);
		animateScore(1);

func _draw() -> void:
	drawScore(0, botSteps, botEnergy, maxSteps, maxEnergy, Color(0.466, 0.466, 0.466, 1.0));
	drawScore(1, playerSteps, playerEnergy, maxSteps, maxEnergy, Color.RED);
	
func animateScore(index: int) -> void:
	for i in range(scores[index].steps.size()):
		var tween = create_tween();
		tween.tween_method(
			func(value): addProgress(index, scores[index].segment, value), 
			0.0, 
			1.0, 
			animationSpeed
		);
		
		await tween.finished
		scores[index].segment += 1;

func addProgress(index:int, segment: int, value: float) -> void:
	if (segment >= scores[index].steps.size()): return;
	scores[index].steps[segment] = value;
	queue_redraw();

func drawScore(
	score: int, 
	steps: Array, 
	energy: Array, 
	maxSteps: int,
	maxEnergy: int, 
	color: Color
) -> void:
	
	var offsetY = 2;
	var offsetX = 0;
	
	var oldPos = Vector2(tableStart.x - 16, tableEnd.y - offsetY);
	
	var quoc: float = float(maxSteps) / 11;
	var currX = 1;
	
	for i in range(maxSteps):
		if (i >= steps.size() - 1): break;
		var spaceBetweenElementsY = (tableEnd.y - tableStart.y - offsetY * 2) * (float(energy[i]) / maxEnergy)
		var spaceBetweenElementsX = (tableEnd.x - tableStart.x - offsetX * 2) / maxSteps * float(i);
		
		var pos = Vector2(tableStart.x + offsetX + spaceBetweenElementsX, tableEnd.y - offsetY - spaceBetweenElementsY);
		
		if ((i + 1) == ceil(currX * quoc)):
			draw_line(Vector2(pos.x, tableEnd.y - 2), Vector2(pos.x, tableEnd.y - 5), Color.WHITE, 1);
			draw_string(font, Vector2(pos.x - 1.6, tableEnd.y + 8), "%d" % (i + 1), HORIZONTAL_ALIGNMENT_CENTER, -1, 8);
			currX += 1;
		
		draw_line(oldPos, oldPos.lerp(pos, scores[score].steps[i]), color, 1.5);
		
		oldPos = pos;
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
