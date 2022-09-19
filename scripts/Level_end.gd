extends Node2D

var player

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player = body
		PlayerStats.level_end()
		get_tree().change_scene("res://scenes/Menu_screens/LevelSelect.tscn")
