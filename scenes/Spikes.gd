extends StaticBody2D

@onready var area_2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.connect("body_entered", _on_body_entered)
	
func _on_body_entered(body: Node):
	if body.has_method("take_damage"):
		body.take_damage()
