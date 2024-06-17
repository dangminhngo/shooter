extends ItemBase

func hit():
	$LidSprite.hide()
	if opened:
		return
	for i in range(3):
		var random_selected_position = ($SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count()) as Marker2D).global_position
		open.emit(random_selected_position, current_direction)
	opened = true
