extends CharacterBody2D

const speed = 100
var current_dir = "none"
var  screen_size

func _ready():
	$AnimatedSprite2D.play("front_player")
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	player_movment(delta)
func player_movment(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		velocity.y = 0
		current_dir = "right"
		play_anim(1)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		velocity.y = 0 
		current_dir = "left"
		play_anim(1)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		velocity.x = 0
		current_dir = "down"
		play_anim(1)
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		velocity.x = 0
		current_dir = "up"
		play_anim(1)
	else :
		velocity.x = 0
		velocity.y = 0
		play_anim(0)
	move_and_slide()
	position = position.clamp(Vector2.ZERO,screen_size)
	
func play_anim(movment):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	if dir == "right" : 
		anim.flip_h = false
		if movment == 1 :
			anim.play("walk_side_player")
		elif movment == 0 : 
			anim.play("side_player")
	elif dir == "left" : 
		anim.flip_h = true
		if movment == 1 :
			anim.play("walk_side_player")
		elif movment == 0 : 
			anim.play("side_player")
	elif dir == "down" : 
		if movment == 1 :
			anim.play("walk_front_player")
		elif movment == 0 : 
			anim.play("front_player")	
	elif dir == "up" : 
		if movment == 1 :
			anim.play("walk_back_player")
		elif movment == 0 : 
			anim.play("back_player")	

	
