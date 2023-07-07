extends CharacterBody2D

signal life_change(player_hearts)

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
const ACCELERATION = 1000
const GRAVITY = 1000

var current_heart = 6
var banana = 0

var hooked = false
var target: Vector2 = Vector2()
var dist: float = 0

var antiGravityActivado = false

var previous_animation = ""
var is_moving = false

var air_jump = false

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot = $Pivot

@onready var hook_detector = $HookDetector
@onready var hook_line = $HookLine
@onready var heart = $CanvasLayer/heart
@onready var game_over = $CanvasLayer/Game_over
	
func _ready():
	update_heart_num()
	pass

func update_heart_num():
	heart.update_heart(current_heart)
	if current_heart <= 0:
		emit_signal("life_change", current_heart)
		game_over.show()
		get_tree().paused = true
		
func update_banana_num():
	banana += 1
	$CanvasLayer/bananaCounter.text = str(banana)
	
#Calculo de la gravedad
func _gravity(delta):
	if antiGravityActivado == false:
		velocity.y += GRAVITY * delta
		if velocity.y > 2000:
			velocity.y = 2000
	elif antiGravityActivado == true:
		velocity.y -= GRAVITY * delta
		if velocity.y < -2000:
			velocity.y = -2000
		#else:
		#	velocity.y += GRAVITY * delta
		#	if velocity.y > 2000:
		#		velocity.y = 2000
		
#Detectar si hay un bloque para el gancho
func create_hook():
#func create_hook() -> bool:
	if (hook_detector.is_colliding()):
		var body: Node2D = hook_detector.get_collider()
		if (body.is_in_group("Hookable")):
			if body.is_in_group("take_damage"):
				current_heart -= 1
				update_heart_num()
			target = hook_detector.get_collision_point()
			hook_line.add_point(Vector2())
			hook_line.add_point(to_local(target))
			dist = global_position.distance_to(target)
			return true
	return false

#Calculo de la velocidad mientras esta colgado
func _swing(delta):
	var radius: Vector2 = global_position - target
	if velocity.length() < 0.1 or radius.length() < 10: return false
	var angle: float = acos(radius.dot(velocity)/(radius.length() * velocity.length()))
	#Si el angulo es muy chico, significa que estamos frenando, así que paramos
	if abs(angle) < 0.02:
		if global_position.distance_to(target) > dist:
			global_position = target + radius.normalized() * dist
		velocity = Vector2()
		return false
	var rad_vel: float = cos(angle) * velocity.length()
	velocity += radius.normalized() * -rad_vel
	#Limite para no salir del radio maximo
	if global_position.distance_to(target) > dist:
		global_position = target + radius.normalized() * dist
	velocity.x += (to_local(target)).normalized().x * 2000 * delta
	return true

func _physics_process(delta):
	# Salto
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
		
	# Salto
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			# On ground, perform regular jump
			velocity.y = JUMP_VELOCITY
		elif !hooked && !air_jump:
			# In air, perform air jump if not hooked and air jump not used
			velocity.y = JUMP_VELOCITY
			air_jump = true
	
	#Movimiento si estamos colgando
	if hooked:
		#Acortar el gancho
		#if Input.is_action_pressed("up") && dist > 100:
		#	dist -= 

		#Impulso para balancearse
		if Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
			velocity.x -= 8
		if !Input.is_action_pressed("left") and Input.is_action_pressed("right"):
			velocity.x += 8
		
		#Actualizar la posición de la linea
		hook_line.set_point_position(1, to_local(target))
		_gravity(delta)
		
		#Si todavía tiene impulso, frenamos un poco (Pueden borrar esto)
		#si quieren que no vaya frenando
		if _swing(delta):
			velocity *= 0.99
		
		#Verificar si soltamos el click
		if Input.is_action_just_released("hook"):
			hooked = false
		
		move_and_slide()
		
		return

	#Movimiento si no estamos colgando
	else:
		#Limpiamos la linea y actualizamos el raycast
		hook_line.clear_points()
		hook_detector.target_position = get_local_mouse_position() - hook_line.position
		
		#Si hacemos click y es un lugar valido, creamos el gancho
		if Input.is_action_just_pressed("hook") and create_hook():
			hooked = true
			previous_animation = "run_no_tail" if is_moving else "idle_no_tail"

		#Movimiento
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
			is_moving = true
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			is_moving = false
			
	# Gravedad
	if not is_on_floor():
		_gravity(delta)

	move_and_slide()
	
	if is_on_floor():
		air_jump = false

	# Animation
	if hooked:
		animation_player.play("idle_no_tail")
	else:
		if velocity.x != 0:
			animation_player.play("run")
		else:
			animation_player.play("idle")
			if previous_animation != "":
				animation_player.play(previous_animation)
				previous_animation = ""
	
	#animation
	#if velocity.x != 0:
	#	animation_player.play("run")
	#else:
	#	animation_player.play("idle")
	
	var move_input = Input.get_axis("left","right")
	
	if move_input > 0:
		$Pivot/Sprite2D.flip_h = false
		$HookLine.position.x = 9 #posicion de la cola "right"
	elif move_input < 0:
		$Pivot/Sprite2D.flip_h = true
		$HookLine.position.x = 48 #posicion de la cola "left"
		#$CollisionShape2D.position.x = 11
		#$CollisionPolygon2D.position.x = 24
	
func _on_body_entered(body: Node):	
	if body.has_method("take damage"):
		body.take_damage()
	if body is CharacterBody2D:
		var character = body as CharacterBody2D
		character.velocity = (character.global_position - global_position)

func take_damage(_dam: int) -> void:
	current_heart -= 1
	update_heart_num()
	
func _on_antigravity_body_entered(body):
	if body.is_in_group("Player") and antiGravityActivado == false:
		antiGravityActivado = true
		$Pivot/Sprite2D.flip_v = true
		$CollisionShape2D.position.y = -158
	elif body.is_in_group("Player") and antiGravityActivado == true:
		antiGravityActivado = false
		$Pivot/Sprite2D.flip_v = false
		$CollisionShape2D.position.y = -57
