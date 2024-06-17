extends CharacterBody2D

var player_nearby: bool = false

var can_laser: bool = true

signal laser(pos, direction)

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var random_selected_laser_pos = ($LaserSpawnPositions.get_child(randi() % $LaserSpawnPositions.get_child_count()) as Marker2D).global_position
			var scout_direction = (Globals.player_pos - position).normalized()
			laser.emit(random_selected_laser_pos, scout_direction)
			can_laser = false
			$LaserTimer.start()

func _on_attack_area_body_entered(_body:Node2D):
	player_nearby = true


func _on_attack_area_body_exited(_body:Node2D):
	player_nearby = false
	
func _on_laser_timer_timeout():
	can_laser = true

