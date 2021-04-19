extends KinematicBody2D

export(bool) var isCoin = true

func _on_Hitbox_area_entered(area):
	get_parent().get_parent().nextLevel()
