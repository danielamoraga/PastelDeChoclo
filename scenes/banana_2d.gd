extends Area2D

func _on_body_entered(body):
	# el mono se hace mas grande
	#body.scale.x += 0.2
	#body.scale.y += 0.2
	
	if body.name == "Player":
		queue_free()
		body.update_banana_num()
	
