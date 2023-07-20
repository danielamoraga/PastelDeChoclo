extends Node2D

@onready var margin2 = $MarginContainer2

func _ready():
	margin2.hide()

func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		margin2.show()
	
func _on_area_2d_2_body_exited(body):
	if body.name == "Player":
		margin2.hide()

