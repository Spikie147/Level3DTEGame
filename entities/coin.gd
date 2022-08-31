extends Node2D

var player

func _ready():
	$AnimationPlayer.play("coin_spin")

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player = body
		player.coin_get(1)
		queue_free()
