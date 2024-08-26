extends CharacterBody2D


const SPEED = 300.0 # valor da velocidade de movimento
const JUMP_VELOCITY = -350.0  # valor da velocidade do pulo


var is_dashing = false 
var dash_speed = 400.0
var dash_duration = 0.2
var dash_cooldown = 1.0
var can_dash = true
var direction
var pular = false

var meBateram = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") #valor da gravidade

signal morri


		



#func end_dash():
	#dashing = false 
	#await "(get_tree().create_timer(dash_cooldown),"timeout")"
	#can_dash = true


#func start_dash():
	#dashing = true
	#can_dash = false
	#dash_timer = dash_duration
	


func _physics_process(delta):  #variavel auxiliar
		
		
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !meBateram: #Comando para o pulo funcionar
		velocity.y = JUMP_VELOCITY #velocidade do pulo
		pular = true
	elif !is_on_floor():
			velocity.y += gravity * delta #calculo da queda
			pular = false
	
	var direction = Input.get_axis("ui_left", "ui_right") #comando para andar para a direita e esquerda
	
	if direction and !meBateram:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) 
	
	#ANIMAÇÃO
	if !meBateram:
		if is_on_floor(): #se está no chão
			if pular:
				print("pulando")
				$AnimatedSprite2D.play("jump")
			elif direction !=0:#em movimento		 
				$AnimatedSprite2D.play("run")
			else:  			
				$AnimatedSprite2D.play("idle") 
		else :#não está no chão
			if velocity.y <0:
				$AnimatedSprite2D.play("jump")
			else:
				$AnimatedSprite2D.play("fall")
		
	move_and_slide() 


func _caiudoMundo():
	
		Global.Vida ==0
		emit_signal("morri")


func _levouDano():
	if Global.Vida ==1 :
		print("Morri ;-;") 
		emit_signal("morri")
		
	else:
		Global.Vida -= 1
		meBateram = true
		#velocity.x =-400
		$AnimatedSprite2D.play("hit")
		await $AnimatedSprite2D.animation_finished
		meBateram = false
		print("Ai")
		print(Global.Vida)
		
