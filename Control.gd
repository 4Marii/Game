extends Control

@onready var Timer_conta = $MarginContainer/conta_tempo/Timer_conta as Label
@onready var Contador_item = $MarginContainer/conta_item/Contador_item as Label

@onready var timer = $Timer as Timer

signal tempo_acabou() #sinal quando tempo parar

var minutos = 0
var segundos = 0

#para limitrar o tempo
@export_range(0,2) var min_padrao = 0
@export_range(0,59) var seg_padrao = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Contador_item.text = str("%03d" % Global.somaPontos)
	Timer_conta.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	minutos = min_padrao
	segundos = seg_padrao

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Contador_item.text = str("%03d" % Global.somaPontos)
	if minutos == 0 && segundos == 0 :
		emit_signal("tempo_acabou")




func _on_timer_timeout(): #temporizador
	if segundos >= 60:
		minutos +=1
		segundos %= 60
	
	if segundos ==0: #quando segundos acabar
		if minutos>0: #e tiver minutos
			minutos -=1 #diminui um minuto 
			segundos = 60 # aumenta 60 segundos
		
	segundos -=1
	
	Timer_conta.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)

#func _on_body_entered():
	#if body.name == "Player":
		#print("pegou timer")
		#Global.relogio
