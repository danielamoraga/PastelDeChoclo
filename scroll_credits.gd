extends MarginContainer

@onready var back = %Back

func _ready():
	back.pressed.connect(_on_back_pressed)
	
func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
