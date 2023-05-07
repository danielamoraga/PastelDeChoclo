extends Node

signal fps_displayed(value)

func toggle_fullscreen(value):
	if value == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif value ==	true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)	
	
func toggle_vsync(value):
	if value == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	if value == false:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func toggle_fps_display(value):
	emit_signal("fps_displayed", value)
