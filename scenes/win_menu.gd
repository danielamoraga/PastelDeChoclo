extends MarginContainer

@onready var next_level = %"Next Level"
@onready var main_menu = %"Main Menu"

func _ready():
	next_level.pressed.connect(_on_next_level_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	hide()
	
func _on_win_zone_win():
	var win_menu = load("res://scenes/win_menu.tscn").instantiate()
	add_child(win_menu)
	show()
	
func _on_next_level_pressed():
	get_tree().paused = false
	#get_tree().change_scene_to_file("res://scenes/level1.tscn")
	# siguientes niveles
	GlobalNextLevel.current_level += 1
	#get_tree().change_scene_to_file("res://scenes/level" + str(GlobalNextLevel.current_level) + ".tscn")
	#hide()
	
	# Construct the path to the next level scene
	var next_level_path = "res://scenes/level" + str(GlobalNextLevel.current_level) + ".tscn"

	# Check if the next level scene file exists
	var resource_loader = ResourceLoader.exists(next_level_path)
	if resource_loader == true:
		# If the scene file exists, load it
		get_tree().change_scene_to_file(next_level_path)
	else:
		get_tree().change_scene_to_file("res://scenes/win_game_complete.tscn")
		show()
	
	# Hide this scene (assuming this script is attached to the current scene)
	hide()
	
func _on_main_menu_pressed():
	MainMenuMusicController.play_music()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	get_tree().paused = false
	GlobalNextLevel.current_level = 0
	
