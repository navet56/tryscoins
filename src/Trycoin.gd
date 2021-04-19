extends KinematicBody2D

	


func _on_Hitbox_area_entered(area):
	get_parent().get_parent().nextLevel()
