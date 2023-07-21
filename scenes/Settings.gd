extends MarginContainer

@onready var close = %Close_Button

#Video Settings
@onready var display_options = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayButton
@onready var vsync_btn = $SettingsTabs/Video/MarginContainer/VideoSettings/VsyncButton
@onready var display_fps_btn = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayFPSButton
@onready var max_fps_val = $SettingsTabs/Video/MarginContainer/VideoSettings/HBoxContainer/MaxFPSSlider
#@onready var max_fps_slider = $SettingsTabs/Video/MarginContainer/VideoSettings/Bloom2
@onready var brightness_slider = $SettingsTabs/Video/MarginContainer/VideoSettings/Brightness2/BrightnessSlider

#Audio Settings
@onready var master_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MasterVolume/MasterVolumeSlider
@onready var music_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MusicVolume2/MusicVolumeSlider
@onready var sfx_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/SFXVolume2/SFXVolumeSlider

#Gameplay Settings
#@onready var mouse_sens_val = $SettingsTabs/Gameplay/MarginContainer/GameplaySettings/MouseSensitivity2/MouseSensitivityLabel
#@onready var mouse_sens_slider = $SettingsTabs/Gameplay/MarginContainer/GameplaySettings/MouseSensitivity2/MouseSensitivitySlider


# Called when the node enters the scene tree for the first time.
func _ready():
	display_options.select(1 if Save.game_data.fullscreen_on else 0)
	GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen_on)
	vsync_btn.button_pressed = Save.game_data.vsync_on
	display_fps_btn.button_pressed = Save.game_data.display_fps
	close.pressed.connect(_on_close_pressed)
	master_vol_slider.value = Save.game_data.master_vol
	
func _on_close_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_display_button_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index == 1 else false)
	Save.game_data.fullscreen_on = (true if index == 1 else false)
	Save.save_data()
	pass # Replace with function body.


func _on_vsync_button_toggled(button_pressed: bool) -> void:
	if button_pressed:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	Save.game_data.vsync_on = button_pressed
	Save.save_data()


func _on_max_fps_slider_value_changed(_value):
	pass


func _on_brightness_slider_value_changed(value):
	GlobalSettings.update_brightness(value)


func _on_master_volume_slider_value_changed(vol):
	AudioServer.set_bus_volume_db(0,vol+11)
	Save.game_data.master_vol = vol
	Save.save_data()
	
func _on_mouse_sensitivity_slider_value_changed(_value):
	pass # Replace with function body.
