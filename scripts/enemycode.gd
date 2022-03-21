extends KinematicBody2D

const GRAVITY =10
export(int) var SPEED =20
const FLOOR=Vector2(0,1)
var velocity=Vector2()
var direction=1

func _physics_process(delta):
	velocity.x=SPEED*direction
	if direction == 1:
		$AnimatedSprite.play("walk_right")
		$AnimatedSprite.flip_h=false 
	else:
		$AnimatedSprite.play("walk_left")
		velocity.y+=GRAVITY
		velocity=move_and_slide(velocity, FLOOR)

	#if $RayCast2D.is_colliding()==false:
		#direction=direction*-1
		#$RayCast2D.position.x*=-1
	#if get_slide_count()>0:
		#for i in range(get_slide_count()):
			#if "playercharactertest" in get_slide_collision(i).collider.name:
				#get_slide_collision(i).collider.dead()
