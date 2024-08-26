extends Node2D

@onready var player = $Player
@onready var control = $HUD/Control
@onready var menu = $MENU
@onready var game_over = $GameOver

func _ready():
	player.morri.connect(_tentarNovamente) #comando para ler sinal de morte
	control.tempo_acabou.connect(_tentarNovamente)
	menu.resetar.connect(_resetarJogo)
	Global.Vida = 3
	Global.somaPontos = 0 
	

func _tentarNovamente():
	get_tree().change_scene_to_file("res://game_over.tscn")
	


func _resetarJogo():  # comando para resetar o game
	get_tree().reload_current_scene()
	Global.somaPontos = 0  #variavel para somar pontos
	Global.Vida = 3
	print("Reiniciar jogo")
	

