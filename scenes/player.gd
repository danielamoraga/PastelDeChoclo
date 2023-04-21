extends CharacterBody2D

var speed = 450
var gravity = 10

var motion = Vector2()

var hook_pos = Vector2()
var hooked = false
var rope_length = 500
var current_rope_length

func _ready():
	current_rope_length = rope_length

func _gravity():
	motion.y += gravity

func move(delta):
	if Input.is_action_pressed("move_right"):
		motion.x = speed
	elif Input.is_action_pressed("move_left"):
		motion.x = -speed
	else:
		motion.x = 0

func _physics_process(delta):
	print(position)
	hook()
	#update()
	if hooked:
		swing(delta)
		motion *= 0.975 #speed of swing
		velocity = motion
		move_and_slide()
		
	_gravity()
	move(delta)
	velocity = motion
	move_and_slide()

func _draw():
	var pos = global_position
	
	if hooked:
		draw_line(Vector2(0,0), to_local(hook_pos), Color(0,35,0.7,0.9),3,true) #cyan
	else:
		return
		
		var colliding = $Raycast.is_colliding()
		var collide_point = $Raycast.get_collision_point()
		if colliding and pos.distance_to(collide_point) > rope_length:
			draw_line(Vector2(0,0), to_local(collide_point), Color(1,1,1,0.25),0.5,true) #white
func hook():
	$Raycast.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("left_click"):
		hook_pos = get_hook_pos()
		if hook_pos:
			hooked = true
			current_rope_length = global_position.distance_to(hook_pos)
			
func get_hook_pos():
	for raycast in $Raycast.get_children():
		if raycast.is_colliding():
			return raycast.get_collision_point()
			
func swing(delta):
	var radius = global_position - hook_pos
	if motion.length() < 0.01 or radius.length() < 10: return
	var angle = acos(radius.dot(motion) / (radius.length() * motion.length()))
	var rad_vel = cos(angle) * motion.length()
	motion += radius.normalized() * -rad_vel
	
	if global_position.distance_to(hook_pos) > current_rope_length:
		global_position =hook_pos + radius.normalized() * current_rope_length
		
	motion += (hook_pos - global_position).normalized() * 15000 * delta
	
