extends Control

func _ready():
	$Lives.text = "["+str(PlayerStats.lives)+"]"
