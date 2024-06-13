extends LevelBase

func _on_exit_gate_area_body_entered(_body:Node2D):
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")

