extends Node

#Player variables
var health = 75
var max_health = 100
var lives = 3
var lives_max = 3

func _on_enemycode_hit_player():
	take_damage(5)

func _ready():
	var health = 75
	var max_health = 100
	var lives = 3
	var lives_max = 3

func take_damage(amount):
	change_health(-amount)

func change_health(amount):
	health += amount
	health = clamp(health, 0, max_health)

func get_health():
	return str(health)
 

