extends StaticBody2D
class_name ItemBase

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
signal open(position:Vector2, direction: Vector2)
var opened: bool = false

func hit():
	print("item container object")
