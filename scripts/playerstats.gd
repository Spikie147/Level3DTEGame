extends Node

#Player variables
var health
var max_health = 100
var lives
var lives_max = 3
var coins

func _on_enemycode_hit_player():
	take_damage(5)

func _ready():
	health = 100
	max_health = 100
	lives = 3
	lives_max = 3
	coins = 0

func level_end():
	health = 100
	lives = 3

func take_damage(amount):
	change_health(-amount)

func change_health(amount):
	health += amount
	health = clamp(health, 0, max_health)

func get_health():
	return str(health)
 
func change_coins(amount):
	coins += amount
