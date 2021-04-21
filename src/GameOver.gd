extends Node2D

func _on_MenuButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://MainMenu.tscn")
