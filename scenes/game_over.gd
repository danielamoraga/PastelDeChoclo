extends MarginContainer

signal life_change(player_hearts)

@onready var restart = %Restart
@onready var main_menu = %"Main Menu"
@onready var exit = %Exit

func _ready():
	restart.pressed.connect(_on_restart_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	exit.pressed.connect(_on_exit_pressed)
	hide()
	
func _on_life_change(player_hearts):
	var game_over = load("res://scenes/game_over.tscn").instance()
	add_child(game_over, true)
	# Pause the game
	get_tree().paused = true
	# Disable player input
	var player = get_parent().get_node("Player")
	player.input_process = false
	
func _on_restart_pressed():
	get_tree().reload_current_scene()
		
func _on_main_menu_pressed():
	MainMenuMusicController.play_music()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	get_tree().paused = false
	
func _on_exit_pressed():
	get_tree().quit()
	
		
