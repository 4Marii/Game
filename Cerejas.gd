extends Area2D
var pontos = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		Global.somaPontos += pontos #Adicionar pontos a soma
		print(Global.somaPontos)
		print("coletou") #testar se tá funcionando
		$Anim_cherry.play("coletado")
		await $Anim_cherry.animation_finished
		queue_free()
