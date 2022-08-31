extends Node2D

onready var DamageTimer = $DamageTimer

var player_in_zone = false
var player

func _on_DamageArea_body_entered(body):
	if body.is_in_group("player"):
		player = body
		player.take_damage(1)
		player_in_zone = true
		DamageTimer.start()

func _on_DamageArea_body_exited(body):
	if body.is_in_group("player"):
		player = null
		player_in_zone = false
		DamageTimer.stop()

func _on_DamageTimer_timeout():
	if player_in_zone:
		player.take_damage(1)
		DamageTimer.start()
