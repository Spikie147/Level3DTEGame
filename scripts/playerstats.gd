extends Node
#Player variables
 
 
var health 
var max_health 
var lives
var lives_max
 
func _ready():
	var health = 100
	var max_health = 200
	var lives = 3
	var lives_max = 3

	
func take_damage(amount):
	change_health(-amount)
	
func change_health(amount):
	health += amount
	health = clamp(health, 0, max_health)
	
func get_health():
	return str(health)
 
