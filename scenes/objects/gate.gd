extends StaticBody2D

signal player_entered_gate(body:Node2D)

func _on_entrance_body_entered(body:Node2D):
	player_entered_gate.emit(body)

