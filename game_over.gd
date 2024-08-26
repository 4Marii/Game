extends CanvasLayer

signal resete

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_resetar_pressed():
	get_tree().change_scene_to_file("res://level.tscn")
	


func _on_sair_pressed():
		get_tree().quit()
