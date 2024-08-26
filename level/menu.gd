extends CanvasLayer

var game_paused = false

signal resetar

func _ready():
	visible = false


func _on_reiniciar_pressed():
	get_tree().paused = false 
	emit_signal("resetar")

func _on_voltar_pressed():
	get_tree().paused = false 
	visible = false


func _unhandled_input(event): # quando pausar
	if event.is_action_pressed("pause"):
		game_paused = !game_paused #flip flop
		get_tree().paused = game_paused #pausar o jogo
		visible = game_paused


func _on_sair_pressed():
	get_tree().quit()
