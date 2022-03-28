extends KinematicBody2D

const ACCELERATION = 850
const MAX_SPEED = 200
const FRICTION = 1000

enum {
	MOVE,
	ATTACK,
}

var state = MOVE
var velocity = Vector2.ZERO
#var stats = PlayerStats

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	move_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)

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



