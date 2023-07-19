extends MarginContainer

@onready var play = %Play
@onready var settings = %Settings
@onready var credits = %Credits
@onready var exit = %Exit

@export var main_scene: PackedScene

func _ready():
	play.pressed.connect(_on_play_pressed)
	settings.pressed.connect(_on_settings_pressed)
	credits.pressed.connect(_on_credits_pressed)
	exit.pressed.connect(_on_exit_pressed)

func _on_play_pressed():
	MainMenuMusicController.stop_music()
	get_tree().change_scene_to_packed(main_scene)
	
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/Settings.tscn")
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
	
func _on_exit_pressed():
	get_tree().quit()

