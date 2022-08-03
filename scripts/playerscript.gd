extends KinematicBody2D
#Cloaked Spy from tf2

const ACCELERATION = 900
const MAX_SPEED = 250
const FRICTION = 1100

enum {
	MOVE,
	ATTACK,
}

var sound

var state = MOVE
var velocity = Vector2.ZERO
#var stats = PlayerStats

var looking = "down"

var animationPlayer 
var animationTree 
var animationState

func _ready():
	animationTree = $AnimationTree
	animationPlayer = $AnimationPlayer
	animationState = $AnimationTree.get("parameters/playback")

#func _ready():
	#AnimationTree.Active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)

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
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_anim_finish():
	state = MOVE

func _on_sword_hit_area_entered(area):
	if area.is_in_group("kys"):
		area.damage()

func area_music():
	sound = SoundPlayer.play_sound_effect("area_1_music")

func _on_pause_menu_pause():
	get_tree().paused = true

func _on_pause_menu_unpause():
	get_tree().paused = false
