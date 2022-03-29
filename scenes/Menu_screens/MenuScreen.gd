extends Control

var sound

func _ready():
	pass # Replace with function body.

func _on_Start_button_pressed():
	get_tree().change_scene("res://scenes/Menu_screens/LevelSelect.tscn")

func _on_Button_pressed():
	sound = SoundPlayer.play_sound_effect("close_game")
	get_tree().quit()
