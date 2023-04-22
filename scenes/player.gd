extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ACCELERATION = 1000
const GRAVITY = 1000

var hooked = false
var target: Vector2 = Vector2()
var dist: float = 0

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot = $Pivot

@onready var hook_detector = $HookDetector
@onready var hook_line = $HookLine

#Calculo de la gravedad
func _gravity(delta):
	velocity.y += GRAVITY * delta
	if velocity.y > 2000:
		velocity.y = 2000
		
#Detectar si hay un bloque para el gancho
func create_hook():
	if (hook_detector.is_colliding()):
		var body: Node2D = hook_detector.get_collider()
		if (body.is_in_group("Hookable")):
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
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#Movimiento si estamos colgando
	if hooked:
		#Acortar el gancho
		if Input.is_action_pressed("up") && dist > 100:
			dist -= 5
			
		#Impulso para balancearse
		if Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
			velocity.x -= 5
		if !Input.is_action_pressed("left") and Input.is_action_pressed("right"):
			velocity.x += 5
		
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
		
		#Movimiento
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	# Gravedad
	if not is_on_floor():
		_gravity(delta)

	move_and_slide()
