extends KinematicBody2D

var run_speed = 150
var velocity = Vector2.ZERO
var player = null

func _physics_process(delta):
	if player == true:
		var vec_to_player = player.global_position - global_position
		vec_to_player = vec_to_player.normalized()
		move_and_collide(vec_to_player * RAND_SPEED * delta)
		
func _process(delta):
	if player.position.y >= position.y:
		get_node("EnemyBody").play("walking_front")
	if player.position.y <= position.y:
		get_node("EnemyBody").play("walk_up")
	if Input.is_action_pressed('left') and enemy_1_FOV == true:
		if player.position.x <= position.x:
			get_node("EnemyBody").play("walking_left")
	if player.position.x >= position.x:
		get_node("EnemyBody").play("walking_right")
	if Input.is_action_pressed('right') and enemy_1_FOV == true:
		if player.position.x >= position.x:
			get_node("EnemyBody").play("walking_right")

	#if $RayCast2D.is_colliding()==false:
		#direction=direction*-1
		#$RayCast2D.position.x*=-1
	#if get_slide_count()>0:
		#for i in range(get_slide_count()):
			#if "playercharactertest" in get_slide_collision(i).collider.name:
				#get_slide_collision(i).collider.dead()






func _on_DetectPlayer_body_entered(body):
	player = body


func _on_DetectPlayer_body_exited(body):
	player = null
