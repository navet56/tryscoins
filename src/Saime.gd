extends KinematicBody2D

var knockback = Vector2.ZERO



func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200*delta)
	knockback = move_and_slide(knockback)

func _on_Hurtbox_area_entered(_area):
	get_tree().change_scene("res://Level2")
	queue_free()
	
