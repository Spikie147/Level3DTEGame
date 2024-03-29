extends Control

var sound
var timer

func _on_Start_button_pressed():
	timer = get_node("Timer")
	timer.set_wait_time(0.15)
	timer.start()
	sound = SoundPlayer.play_sound_effect("click")

func _on_Button_pressed():
	timer = get_node("Close_Timer")
	timer.set_wait_time(2.1)
	timer.start()
	sound = SoundPlayer.play_sound_effect("close_game")
	#OS.shell_open("https://www.youtube.com/watch?v=5i7n5lcmnZw")

func _on_Close_Timer_timeout():
	get_tree().quit()

func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/Menu_screens/LevelSelect.tscn")
