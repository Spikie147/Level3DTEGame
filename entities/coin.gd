extends Node2D

var player

func _on_Area2D_area_entered(body):
	if body.is_in_group("player"):
		player = body
		print("code test")

func _ready():
	$AnimationPlayer.play("coin_spin")
