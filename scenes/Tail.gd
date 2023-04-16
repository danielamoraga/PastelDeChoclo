#extends RigidBody2D

#const TAIL_RETRACTION_SPEED = 100.0
#const TAIL_EXTENSION_SPEED = 200.0
#const TAIL_EXTENSION_AMOUNT = 20.0
#const TAIL_LENGTH = 50.0

#var tail : Line2D

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#	tail = $Line2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
#	if tail.position.distance_to(global_position) > TAIL_LENGTH:
#		retract_tail(delta)
#	else:
#		extend_tail(delta)
	
#func extend_tail(delta):
#	var tail_pos = tail.position
#	var target_pos = global_position + (global_position - tail_pos).normalized() * TAIL_EXTENSION_AMOUNT
#	var new_pos = tail_pos.linear_interpolate(target_pos, TAIL_EXTENSION_SPEED * delta)
#	tail.position = new_pos

#func retract_tail(delta):
#	var tail_pos = tail.position
#	var target_pos = global_position
#	var new_pos = tail_pos.linear_interpolate(target_pos, TAIL_RETRACTION_SPEED * delta)
#	tail.position = new_pos
