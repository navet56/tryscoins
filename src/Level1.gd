extends Node2D

func _ready():
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
		
		
func game_over():
	get_tree().change_scene("res://GameOver.tscn")
	queue_free()
	
func nextLevel():
	get_tree().change_scene("res://Level2.tscn")
	queue_free()
