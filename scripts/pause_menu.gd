extends Control

var timer
var sound

signal pause
signal unpause

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if not visible:
			visible = true
			emit_signal("pause")
		else:
			visible = false
			emit_signal("unpause")

func _on_Resume_button_pressed():
	if visible:
		timer = get_node("Timer")
		timer.set_wait_time(0.15)
		timer.start()
		sound = SoundPlayer.play_sound_effect("click")

func _on_Menu_button_pressed():
	timer = get_node("Menu_Timer")
	timer.set_wait_time(0.15)
	timer.start()
	emit_signal("unpause")

func _on_Timer_timeout():
	if visible:
		visible = false
		emit_signal("unpause")

func _on_Menu_Timer_timeout():
	get_tree().change_scene("res://scenes/Menu_screens/MenuScreen.tscn")
