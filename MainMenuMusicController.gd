extends Node

var main_menu_music = load("res://Música/Menu.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	play_music()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_music():
	
	$Music.stream = main_menu_music
	$Music.play()

func stop_music():
	$Music.stop()
