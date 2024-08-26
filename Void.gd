extends Area2D

@onready var player = $"../Player"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#visible = false


func _on_body_entered(body):
	if body.name == "Player":
		print("Você caiu para fora do mundo")
		player._caiudoMundo()
		queue_free()
	 # Replace with function body.
