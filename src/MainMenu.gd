extends MarginContainer


const first_level = preload("res://Level1.tscn")

onready var selector_quitter = $Node2D/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector1
onready var selector_jouer = $Node2D/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector2
var current_selection = 0

func _ready():
	set_current_selection(0)
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_down") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	if _current_selection == 1:
		get_parent().add_child(first_level.instance())
		queue_free()
	elif _current_selection == 0:
		get_tree().quit()
		
func set_current_selection(_current_selection):
	selector_jouer.text = ""
	selector_quitter.text = ""
	if _current_selection == 0:
		selector_jouer.text = ">"
	elif _current_selection == 1:
		selector_quitter.text = ">"
