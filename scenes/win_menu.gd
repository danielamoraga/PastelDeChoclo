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
	#get_tree().paused = true
	print("1")
	if next_level.is_pressed():
		get_tree().paused = false
		print("2")
	
func _on_next_level_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
	# siguientes niveles
	#get_tree().change_scene_to_file("res://scenes/level1"+str(int(get_tree().current_scene_name)+1))+".tscn")
	hide()

func _on_main_menu_pressed():
	MainMenuMusicController.play_music()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	get_tree().paused = false
	
