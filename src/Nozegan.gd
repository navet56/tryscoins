extends KinematicBody2D

var velocity = Vector2.ZERO
var coins = 0
const ACCELERATION = 2000
const FRICTION = 1000
const MAX_SPEED = 150
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

#enum pour le playerSate
enum {
	BAS,
	HAUT,
	DROITE,
	GAUCHE
}

var playerState = BAS

func _ready():
	animationTree.active = true

#main loop
func _physics_process(delta):

	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if Input.is_action_just_pressed("ui_down"):
		playerState = BAS
	elif Input.is_action_just_pressed("ui_up"):
		playerState = HAUT
	elif Input.is_action_just_pressed("ui_left"):
		playerState = GAUCHE
	elif Input.is_action_just_pressed("ui_right"):
		playerState = DROITE
	
	if input_vector != Vector2.ZERO:
		animationState.travel("Marche")
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Marche/blend_position", input_vector)
		velocity = velocity.move_toward(input_vector* MAX_SPEED,ACCELERATION*delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION*delta)
		
	if Input.is_action_pressed("attack"):	
		match playerState:
			BAS:
				animationPlayer.play("AttackBas")
			HAUT:
				animationPlayer.play("AttackHaut")
			DROITE:
				animationPlayer.play("AttackDroite")
			GAUCHE:
				animationPlayer.play("AttackGauche")
	velocity = move_and_slide(velocity)
	
func _on_Hurtbox_body_entered(body):
	if body.isCoin:
		get_parent().get_parent().nextLevel()
	else:
		get_parent().get_parent().game_over()
	
