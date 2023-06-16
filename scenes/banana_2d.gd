extends Area2D

signal BananaCollected

func _on_body_entered(body):
	# el mono se hace mas grande
	#body.scale.x += 0.2
	#body.scale.y += 0.2
	
	#var platanos = get_tree().get_nodes_in_group("banana")
	if body.name == "Player":
		BananaCollected.emit()
		queue_free()
		
