extends Label


func _ready():
	#GlobalSettings.connect("fps_displayed", self, "_on_fps_displayed")
	pass
	
func _process(_delta):
	text = "FPS: %s" % [Engine.get_frames_per_second()]

func _on_fps_displayed(value):
	visible = value
