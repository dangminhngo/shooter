extends LevelBase

func _on_gate_player_entered_gate(_body:Node2D):
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
