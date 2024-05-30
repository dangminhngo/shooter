extends Node2D

const speed: int = 200

func _ready():
	var size = get_viewport().get_visible_rect().size
	position = Vector2(size.x / 2, size.y / 2)


func _process(delta):
	# for movement
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * speed * delta

	# for shooting laser
	if Input.is_action_pressed("primary_action"):
		print("shoot laser")
	if Input.is_action_pressed("secondary_action"):
		print("throw grenade")

