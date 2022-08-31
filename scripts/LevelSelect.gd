extends Control

var sound
var timer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu_screens/MenuScreen.tscn")

func _on_Matthew_scene_pressed():
	timer = get_node("MatthewScene_Timer")
	timer.set_wait_time(0.15)
	timer.start()
	sound = SoundPlayer.play_sound_effect("click")

func _on_Cody_scene_pressed():
	timer = get_node("CodyScene_Timer")
	timer.set_wait_time(0.15)
	timer.start()
	sound = SoundPlayer.play_sound_effect("click")

func _on_Button_pressed():
	timer = get_node("Exit_Timer")
	timer.set_wait_time(0.15)
	timer.start()
	sound = SoundPlayer.play_sound_effect("click")

func _on_Exit_Timer_timeout():
	get_tree().change_scene("res://scenes/Menu_screens/MenuScreen.tscn")

func _on_CodyScene_Timer_timeout():
	get_tree().change_scene("res://scenes/Enemycharctercodetest.tscn")

func _on_MatthewScene_Timer_timeout():
	get_tree().change_scene("res://scenes/levels/level_1.tscn")
