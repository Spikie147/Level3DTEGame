extends KinematicBody2D

var velocity: Vector2 = Vector2()
var direction: Vector2 = Vector2()
var looking = "down"

func get_input():
	velocity = Vector2()
	#determines how the character moves based on player inputs
	#also plays specific animations depedning on the direction
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
		$AnimationPlayer.play("walk_up")
		looking = "up"
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)
		$AnimationPlayer.play("walk_down")
		looking = "down"
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
		$AnimationPlayer.play("walk_left")
		looking = "left"
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1, 0)
		$AnimationPlayer.play("walk_right")
		looking = "right"
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

func attack():
	if Input.is_action_just_released("down"):
		#if looking == "up":
			
		if Input.is_action_pressed("attack"):
			$AnimationPlayer.play("attack_down")
		#if looking == "left":
			
		#if looking == "right":
			

func _on_Area2D_area_entered(area):
	pass


func _on_sword_hit_area_entered(area):
	if area.is_in_group("kys"):
		area.damage()
