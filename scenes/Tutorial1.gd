extends Node2D

@onready var margin = $MarginContainer

func _ready():
	margin.hide()

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		margin.show()
		
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		margin.hide()


