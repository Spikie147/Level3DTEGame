extends KinematicBody2D

var velocity: Vector2 = Vector2()
var direction: Vector2 = Vector2()

func get_input():
	velocity = Vector2()
	#determines how the character moves based on player inputs
	#also plays specific animations depedning on the direction
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
		$AnimationPlayer.play("walk_up")
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)
		$AnimationPlayer.play("walk_down")
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
		$AnimationPlayer.play("walk_left")
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1, 0)
		$AnimationPlayer.play("walk_right")
	#plays idle animation if the player is not moving
	else:
		if Input.is_action_just_released("up"):
			$AnimationPlayer.play("idle_up")
		if Input.is_action_just_released("down"):
			$AnimationPlayer.play("idle_down")
		if Input.is_action_just_released("left"):
			$AnimationPlayer.play("idle_left")
		if Input.is_action_just_released("right"):
			$AnimationPlayer.play("idle_right")
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)

func _physics_process(delta):
	get_input()
