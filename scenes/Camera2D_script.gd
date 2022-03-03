extends Camera2D

onready var player = get_node("/root/entities/testroom_1/player_test")

func _process(delta):
	
	#controls the camera's position in relation to the player
	position.x = player.position.x
	####comment
