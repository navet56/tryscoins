extends KinematicBody2D

func _on_Hurtbox_area_entered(_area):
	queue_free()
	
