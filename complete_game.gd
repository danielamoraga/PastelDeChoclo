extends MarginContainer

@onready var main_menu = %"Main Menu"

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu.pressed.connect(_on_main_menu_pressed)
	get_tree().paused = false
	show()

func _on_main_menu_pressed():
	MainMenuMusicController.play_music()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	#get_tree().paused = false
	GlobalNextLevel.current_level = 0
	
