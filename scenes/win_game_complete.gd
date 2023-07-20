extends MarginContainer

@onready var main_menu = %"Main Menu"

func _ready():
	main_menu.pressed.connect(_on_main_menu_pressed)
	hide()
	
func _on_main_menu_pressed():
	MainMenuMusicController.play_music()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	get_tree().paused = false
	
