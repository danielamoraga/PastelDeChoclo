extends Node

signal fps_displayed(value)
signal brightness_updated(value)
signal mouse_senes_updated(value)

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

func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0,vol+11)
