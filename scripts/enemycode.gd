extends KinematicBody2D

var run_speed = 100
var velocity = Vector2.ZERO
var playerdetected = false
signal player_hit
var player_in_zone = false
var player 


func ready():
	get_node("EnemyBody").play("idle")
	#current_hp = max_hp


func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
	velocity = move_and_slide(velocity)


func _process(_delta):
	pass

	#if $RayCast2D.is_colliding()==false:
		#direction = direction*-1
		#$RayCast2D.position.x*=-1
	#if get_slide_count()>0:
		#for i in range(get_slide_count()):
			#if "playercharactertest" in get_slide_collision(i).collider.name:
				#get_slide_collision(i).collider.dead()


func _on_Player_detection_area_entered(area):
	if area.is_in_group("player"):
		player = area
		player_in_zone = true



func _on_Player_detection_area_exited(area):
	if area.is_in_group("player"):
		player = null
		player_in_zone = false

