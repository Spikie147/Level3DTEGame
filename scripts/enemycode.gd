extends KinematicBody2D

var run_speed = 100
var velocity = Vector2.ZERO
var playerdetected = false
signal player_hit
var player_in_zone = false
var player = null


func ready():
	get_node("EnemyBody").play("idle")
	#current_hp = max_hp


func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		print("fish dinner")
		velocity = position.direction_to(player.position) * run_speed
	velocity = move_and_slide(velocity)
	#velocity = position.direction_to(player.position) * run_speed
	#move_and_slide(velocity)

func _process(_delta):
	if velocity == Vector2():
		$AnimatedSprite.play("idle")
	elif velocity.y < 0:
		if velocity.y < velocity.x:
			$AnimatedSprite.play("walk_up")
		elif velocity.x > 0:
			$AnimatedSprite.play("walk_right")
		elif velocity.x < 0:
			$AnimatedSprite.play("walk_left")
	elif velocity.y > 0:
		if velocity.y > velocity.x:
			$AnimatedSprite.play("walk_down")
		elif velocity.x > 0:
			$AnimatedSprite.play("walk_right")
		elif velocity.x < 0:
			$AnimatedSprite.play("walk_left")





func _on_Player_detection_body_entered(body):
	print("entered")
	player = body



func _on_Player_detection_body_exited(body):
	print("exited")
	player = null

