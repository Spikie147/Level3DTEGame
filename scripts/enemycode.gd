extends KinematicBody2D

const GRAVITY =10
export(int) var SPEED =20
const FLOOR=Vector2(0,1)
var velocity=Vector2()
var direction=1
var _player = null
const CHASE_SPEED= 1000


func _physics_process(delta):
	velocity.x=SPEED*direction
	if direction == 1:
		$AnimatedSprite.play("walk_right")
		velocity=move_and_slide(velocity)
	elif direction == -1:
		$AnimatedSprite.play("walk_left")
		velocity=move_and_slide(velocity)
	if _player:
		var _player_direction = (_player.position - self.position).normalized()
		move_and_slide(SPEED * _player_direction)

func _on_DetectPlayer_body_entered(body):
	if body.name == "playercharactertest":
		_player = body
func _on_DetectPlayer_body_exited(body):
	if body.name == "playercharactertest":
		_player = body

	#if $RayCast2D.is_colliding()==false:
		#direction=direction*-1
		#$RayCast2D.position.x*=-1
	#if get_slide_count()>0:
		#for i in range(get_slide_count()):
			#if "playercharactertest" in get_slide_collision(i).collider.name:
				#get_slide_collision(i).collider.dead()




