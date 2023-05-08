extends MarginContainer

@onready var play = %Play
@onready var settings = %Settings
@onready var exit = %Exit


@export var main_scene: PackedScene

func _ready():
	play.pressed.connect(_on_play_pressed)
	settings.pressed.connect(_on_settings_pressed)
	exit.pressed.connect(_on_exit_pressed)


func _on_play_pressed():
	get_tree().change_scene_to_packed(main_scene)
	


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/Settings.tscn")

func _on_exit_pressed():
	get_tree().quit()

