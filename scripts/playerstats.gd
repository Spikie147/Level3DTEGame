extends Node
#Player variables
 
 
var health = 100
var max_health = 200

func reset():
	var health = 100
	var max_health = 200
	var armor = 0
	var max_armor = 100
 
func _ready():
	pass
	
func take_damage(amount):
	change_health(-amount)
	
func change_health(amount):
	health += amount
	health = clamp(health, 0, max_health)
	
func get_health():
	return str(health)
 
