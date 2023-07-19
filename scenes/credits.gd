extends Label

@export var scroll_speed = 50

func _ready():
	set_process(true)

func _process(delta):
	var new_position = position.y - delta * scroll_speed
	position.y = new_position
