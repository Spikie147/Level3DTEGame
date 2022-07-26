extends Control

func _ready():
	$Lives.text = String(Playerstats.lives)
