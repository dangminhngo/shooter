extends ItemBase

func hit():
	if opened: return
	var spawn_position = ($SpawnPositions.get_child(0) as Marker2D).global_position
	open.emit(spawn_position, current_direction)
	opened = true
