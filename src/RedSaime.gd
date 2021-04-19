extends KinematicBody2D

var knockback = Vector2.ZERO

export(bool) var isCoin = false

var movement = 0
var dir = 1
var vector = Vector2.LEFT

func _physics_process(delta):
	
	movement += dir
	if movement == 200 or movement == 0:
		dir = -dir
		vector = -vector

	vector = vector.move_toward(vector*3, 6* delta)
	move_and_slide(vector)
	

func _on_Hurtbox_area_entered(_area):
	queue_free()
	
func _on_Hitbox_area_entered(area):
	get_parent().get_parent().game_over()
