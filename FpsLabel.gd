extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)  # Enable node process
	hide()  # Initially, hide the Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	text = "FPS: " + str(int(Engine.get_frames_per_second()))  # Get FPS and convert it to a string without decimals

func _input(event):
	if event.is_action_pressed("toggle_fps"):
		show()
