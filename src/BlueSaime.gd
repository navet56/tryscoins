extends KinematicBody2D

var knockback = Vector2.ZERO

export(bool) var isCoin = false

var movement = 0
var dir = 1
var vector = Vector2(1,1) #diagonale

func _physics_process(delta):
	
	movement += dir
	if movement == 200:
		vector = -vector
		dir = -dir
	elif movement == 0:
		dir = -dir
		vector.x = -vector.x
	elif movement == 100:
		vector.y = -vector.y
		

	vector = vector.move_toward(vector*3, 6* delta)
	move_and_slide(vector)
	

func _on_Hurtbox_area_entered(_area):
	queue_free()
	
func _on_Hitbox_area_entered(area):
	get_parent().get_parent().game_over()
