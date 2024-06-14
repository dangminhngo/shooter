extends Area2D

const rotation_speed: int = 5
const item_types = ["health", "laser", "grenade"]
var type = item_types[randi() % len(item_types)]

func _ready():
	if type == "health":
		$Sprite2D.modulate = Color("48d990")
	elif type == "laser":
		$Sprite2D.modulate = Color("4893d9")
	else:
		$Sprite2D.modulate = Color("d94851")

func _process(delta):
	rotation += rotation_speed * delta
	
func _on_body_entered(body:Node2D):
	# add item to player
	if "add_item" in body:
		body.add_item(type)
		queue_free()
