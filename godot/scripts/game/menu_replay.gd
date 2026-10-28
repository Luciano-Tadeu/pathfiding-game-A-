extends CanvasLayer

@onready var player = $"../Player";
@onready var astar = $"../Bot";

@onready var musica = $"../../MusicaPrincipal";

enum Entities {PLAYER, ROBO};

var confirmations = {
	"Player": false,
	"Astar": false
};

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide();
	
	player.finish.connect(_on_confirm);
	astar.finish.connect(_on_confirm);
	
	offset.y = get_viewport().get_visible_rect().size.y;
	
func showMenu():
	show();
	
	musica.volume_db = -20;
	
	var tween = create_tween();
	tween.tween_property(self, "offset:y", 0.0, 0.3).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT);
	
	await tween.finished;
	get_tree().paused = true;

func _on_confirm(entity: Entities):
	if (entity == Entities.PLAYER):
		confirmations.Player = true;
	else:
		confirmations.Astar = true;
		
	if (confirmations.Player && confirmations.Astar):
		showMenu();
		

func _on_assistir_pressed() -> void:
	var menuFinish = $"../../MenuFinish";
	musica.volume_db = -10;
	
	get_tree().paused = false;
	menuFinish._on_button_comparar_pressed();
	self.queue_free();
	
func _on_voltar_pressed() -> void:
	get_tree().paused = false;
	get_tree().reload_current_scene();
