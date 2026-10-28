extends TouchScreenButton

@export var icone_entrar_tela_cheia: Texture2D
@export var icone_sair_tela_cheia: Texture2D

func _on_released():
	var modo_atual = DisplayServer.window_get_mode()
	
	if modo_atual == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		texture_normal = icone_entrar_tela_cheia
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		texture_normal = icone_sair_tela_cheia
