extends KinematicBody2D
#Cloaked Spy from tf2

const ACCELERATION = 900
const MAX_SPEED = 250
const FRICTION = 1100

enum {
	MOVE,
}

var sound

var state = MOVE
var velocity = Vector2.ZERO

var animationPlayer  
var animationTree 
var animationState

func _ready():
	animationTree = $AnimationTree
	animationPlayer = $AnimationPlayer
	animationState = $AnimationTree.get("parameters/playback")

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
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)

func area_music():
	sound = SoundPlayer.play_sound_effect("area_1_music")

func _on_pause_menu_pause():
	get_tree().paused = true
	
func take_damage(amount):
	print(PlayerStats.health)
	PlayerStats.change_health(-amount)
	if PlayerStats.health <= 0:
		PlayerStats.lives -= 1
		PlayerStats.health = PlayerStats.max_health
	if PlayerStats.lives <= 0:
		get_tree().change_scene("res://scenes/Menu_screens/YouDied.tscn")

func coin_get(amount):
	PlayerStats.change_coins(+amount)

func _on_pause_menu_unpause():
	get_tree().paused = false
