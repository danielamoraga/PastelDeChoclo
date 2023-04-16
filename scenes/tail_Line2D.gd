#extends Line2D

#var original_points := []

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
	# Store the original points of the line
#	original_points = points

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
#func update_tail(length_factor: float, width_factor: float, speed: float):
	# Scale the points based on the length_factor and width_factor
#	var scaled_points = []
#	for point in original_points:
#		var scaled_point = point * Vector2(length_factor, width_factor)
#		scaled_points.append(scaled_point)
#	points = scaled_points
	
	# Animate the tail scaling back to normal size over time
#	var tween = $Tween
#	tween.interpolate_property(self, "points", points, original_points, speed, Tween.TRANS_LINEAR)
#	tween.start()
