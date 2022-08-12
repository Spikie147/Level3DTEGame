extends Control

func _ready():
	$Control/Lives.text = "["+str(PlayerStats.lives)+"]"
	$healthbar.value = PlayerStats.health

func _process(delta):
	$Control/Lives.text = "["+str(PlayerStats.lives)+"]"
	$healthbar.value = PlayerStats.health
