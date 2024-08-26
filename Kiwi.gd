extends Area2D
@onready var control = $"../HUD/Control"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		print("Pegou Timer") 
		control.segundos += 15
		await $CollisionShape2D.call_deferred("queue_free")#remove colisão
		$Anim_kiwi.play("coletado")
		await $Anim_kiwi.animation_finished #termina a animação
		queue_free() 
