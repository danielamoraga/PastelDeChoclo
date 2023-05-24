extends MarginContainer

@onready var next_level = %"Next Level"
@onready var main_menu = %"Main Menu"

func _ready():
	next_level.pressed.connect(_on_next_level_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	hide()
	
func _on_next_level_pressed():
	get_tree().paused = false
	hide()
	
func _on_main_menu_pressed():
	MainMenuMusicController.play_music()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	get_tree().paused = false
