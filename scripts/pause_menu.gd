extends Control

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu_screens/MenuScreen.tscn")

func _ready():
	pass 
