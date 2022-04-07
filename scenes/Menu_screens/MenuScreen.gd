extends Control

var sound
var timer

func _on_Start_button_pressed():
	get_tree().change_scene("res://scenes/Menu_screens/LevelSelect.tscn")

func _on_Button_pressed():
	timer = get_node("Timer")
	timer.set_wait_time(2.1)
	timer.start()
	sound = SoundPlayer.play_sound_effect("close_game")

func _on_Timer_timeout():
	get_tree().quit()
