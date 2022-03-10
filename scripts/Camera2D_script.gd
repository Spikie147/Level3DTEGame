extends Camera2D

	#controls the camera's position in relation to the player
func _process(delta):
	var player = get_parent().get_node("playercharactertest")
	position.x = player.position.x	
	position.y = player.position.y
