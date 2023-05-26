extends Area2D

@onready var win_menu = $CanvasLayer/Win_Menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _physics_process(_delta):
	var win_zone = get_overlapping_bodies()
	for body in win_zone:
		if body.name == "Player":
			win_menu.show()
			get_tree().paused = true
