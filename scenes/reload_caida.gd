extends Area2D

func _on_caidaVacio_body_entered(body):
	if body.name == "Player":
		# cargar escena nuevamente cuando se cae al vacio
		get_tree().reload_current_scene()
		# o tirar a game_over (*por implementar)
		
