extends Node2D

@onready var margin1 = $MarginContainer1

func _ready():
	margin1.hide()

func _on_area_2d_1_body_entered(body):
	if body.name == "Player":
		margin1.show()
		
func _on_area_2d_1_body_exited(body):
	if body.name == "Player":
		margin1.hide()


