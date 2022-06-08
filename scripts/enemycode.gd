extends KinematicBody2D

var run_speed = 100
var velocity = Vector2.ZERO
var player = null
var playerdetected = false


func ready():
	get_node("EnemyBody").play("idle")
	#current_hp = max_hp


func _physics_process(_delta):
	if player:
		var player_direction = (player.position - self.position).normalized()
		move_and_slide(run_speed * player_direction)

func _process(_delta):
	if player.position.y >= position.y:
		$AnimatedSprite.play("walk_down")
	elif player.position.y <= position.y:
		$AnimatedSprite.play("walk_up")
	elif player.position.x >= position.x:
		$AnimatedSprite.play("walk_right")
	elif player.position.x <= position.x:
		$AnimatedSprite.play("walk_left")


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
