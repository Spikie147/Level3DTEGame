extends KinematicBody2D

export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED = 120
export var FRICTION = 500

enum {
	MOVE,
	ATTACK,
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
#var stats = PlayerStats

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		#swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

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



#func get_input():
#	velocity = Vector2()
#	#determines how the character moves based on player inputs
#	#also plays specific animations depedning on the direction
#	if Input.is_action_pressed("up"):
#		velocity.y -= 1
#		direction = Vector2(0, -1)
#		$AnimationPlayer.play("walk_up")
#		looking = "up"
#	if Input.is_action_pressed("down"):
#		velocity.y += 1
#		direction = Vector2(0, 1)
#		$AnimationPlayer.play("walk_down")
#		looking = "down"
#	if Input.is_action_pressed("left"):
#		velocity.x -= 1
#		direction = Vector2(-1, 0)
#		$AnimationPlayer.play("walk_left")
#		looking = "left"
#	if Input.is_action_pressed("right"):
#		velocity.x += 1
#		direction = Vector2(1, 0)
#		$AnimationPlayer.play("walk_right")
#		looking = "right"
#	#plays idle animation if the player is not moving
#	else:
#		if Input.is_action_just_released("up"):
#			$AnimationPlayer.play("idle_up")
#		if Input.is_action_just_released("down"):
#			$AnimationPlayer.play("idle_down")
#		if Input.is_action_just_released("left"):
#			$AnimationPlayer.play("idle_left")
#		if Input.is_action_just_released("right"):
#			$AnimationPlayer.play("idle_right")
#
#	velocity = velocity.normalized()
#	velocity = move_and_slide(velocity * 200)