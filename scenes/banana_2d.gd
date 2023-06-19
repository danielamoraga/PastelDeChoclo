extends Area2D

func _on_body_entered(body):
	# el mono se hace mas grande
	#body.scale.x += 0.2
	#body.scale.y += 0.2
	#body.scale *= Vector2(1.2, 1.2)
	
	if body.name == "Player":
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "position", position - Vector2(0, 150).rotated(deg_to_rad(-45)), 0.3)
		tween1.tween_property(self, "modulate:a", 0, 0.3)
		tween.tween_callback(queue_free)
		#tween.tween_callback(queue_free)
		#queue_free()
		body.update_banana_num()
