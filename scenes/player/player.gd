extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed = 500
var speed: int = max_speed

signal laser(pos, direction)
signal grenade(pos, direction)

func _process(_delta):
	# for movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position

	# rotate
	look_at(get_global_mouse_position())

	var player_direction = (get_global_mouse_position() - position).normalized()

	# for shooting laser
	if Input.is_action_pressed("primary_action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		can_laser = false
		$LaserTimer.start()
		# randomly selected the marker for laser
		var laser_markers = $LaserStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		laser.emit(selected_marker.global_position, player_direction)

	if Input.is_action_pressed("secondary_action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1		
		can_grenade = false
		$GrenadeTimer.start()
		var grenade_marker = $LaserStartPositions.get_children()[0]
		grenade.emit(grenade_marker.global_position, player_direction)


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true

func add_item(type: String):
	if type == "laser":
		Globals.laser_amount += 5
	if type == "grenade":
		Globals.grenade_amount += 1
	if type == "health":
		Globals.player_health += 20
