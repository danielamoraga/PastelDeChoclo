extends Node

const SAVEFILE = "user://SAVEFILE.save"

var game_data = {}

func _ready() -> void:
	load_data()
	print(game_data)
	
func load_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if not file:
		game_data ={
			"fullscreen_on":false,
			"vsync_on":true,
			"display_fps":false,
			"max_fps": 0,
			"brightness":1,
			"master_vol":-10,
			"music_vol":-10,
			"sfx_vol":-10,
			"mouse_sens":0.002,
		}
		save_data()
	else:
		game_data = file.get_var()
		file.close()
		

func save_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	#file.open(SAVEFILE,FileAccess.WRITE)
	file.store_var(game_data)
	file.close()
