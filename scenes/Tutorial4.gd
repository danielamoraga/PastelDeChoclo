extends Node2D

@onready var margin3 = $MarginContainer3

func _ready():
	margin3.hide()

func _on_area_2d_3_body_entered(body):
	if body.name == "Player":
		margin3.show()

func _on_area_2d_3_body_exited(body):
	if body.name == "Player":
		margin3.hide()
