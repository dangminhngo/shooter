extends CharacterBody2D

@export var speed: int = 50

func _process(_delta):
	# direction
	var direction = Vector2.RIGHT
	# velocity
	velocity = direction * speed
	# move and slide
	move_and_slide()

func hit():
	print("damaged")
