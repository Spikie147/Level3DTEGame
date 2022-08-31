extends Control

func _ready():
	$Control/Lives.text = "["+str(PlayerStats.lives)+"]"
	$Coins/coins.text = "["+str(PlayerStats.coins)+"]"
	$healthbar.value = PlayerStats.health

func _process(delta):
	$Control/Lives.text = "["+str(PlayerStats.lives)+"]"
	$Coins/coins.text = "["+str(PlayerStats.coins)+"]"
	$healthbar.value = PlayerStats.health
