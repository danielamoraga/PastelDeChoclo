extends MarginContainer

#Video Settings
@onready var display_options = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayButton
@onready var vsync_btn = $SettingsTabs/Video/MarginContainer/VideoSettings/VsyncButton
@onready var display_fps_btn = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayFPSButton
@onready var max_fps_val = $SettingsTabs/Video/MarginContainer/VideoSettings/HBoxContainer/MaxFPSSlider
@onready var max_fps_slider = $SettingsTabs/Video/MarginContainer/VideoSettings/Bloom2
@onready var brightness_slider = $SettingsTabs/Video/MarginContainer/VideoSettings/Brightness2/BrightnessSlider

#Audio Settings
@onready var master_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MasterVolume/MasterVolumeSlider
@onready var music_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MusicVolume2/MusicVolumeSlider
@onready var sfx_vol_slider = $SettingsTabs/Audio/MarginContainer/AudioSettings/SFXVolume2/SFXVolumeSlider

#Gameplay Settings
@onready var mouse_sens_val = $SettingsTabs/Gameplay/MarginContainer/GameplaySettings/MouseSensitivity2/MouseSensitivityLabel
@onready var mouse_sens_slider = $SettingsTabs/Gameplay/MarginContainer/GameplaySettings/MouseSensitivity2/MouseSensitivitySlider


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_display_button_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index == 1 else false)
	pass # Replace with function body.


func _on_vsync_button_toggled(button_pressed):
	pass # Replace with function body.


func _on_display_fps_button_toggled(button_pressed):
	pass # Replace with function body.


func _on_max_fps_slider_value_changed(value):
	pass # Replace with function body.


func _on_brightness_slider_value_changed(value):
	pass # Replace with function body.


func _on_master_volume_slider_value_changed(value):
	pass # Replace with function body.


func _on_music_volume_slider_value_changed(value):
	pass # Replace with function body.


func _on_sfx_volume_slider_value_changed(value):
	pass # Replace with function body.


func _on_mouse_sensitivity_slider_value_changed(value):
	pass # Replace with function body.
