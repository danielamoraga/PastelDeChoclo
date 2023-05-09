extends HBoxContainer

const full_heart = preload("res://assets/full_heart.png")
const empty_heart = preload("res://assets/empty_heart.png")
const half_heart = preload("res://assets/half_heart.png")

enum TYPES {type1,type2,type3}
@export var type : TYPES = TYPES.type1

func update_heart(value: int) -> void:
	match type:
		TYPES.type1:
			update_type(value)
	
func update_type(value: int) -> void:
	for i in range(get_child_count()):
		if i * 2 < value - 1:
			get_child(i).texture = full_heart
		elif i * 2 == value - 1:
			get_child(i).texture = half_heart
		else:
			get_child(i).texture = empty_heart
