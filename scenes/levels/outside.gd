extends LevelBase

func _on_gate_player_entered_gate(_body:Node2D):
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	call_deferred("change_to_inside_level")

func change_to_inside_level():
	TransitionLayer.change_to_scene("res://scenes/levels/inside.tscn")
	
