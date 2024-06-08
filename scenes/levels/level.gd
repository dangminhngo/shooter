extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projecttiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projecttiles/grenade.tscn")

func _on_gate_player_entered_gate(body:Node2D):
	print("player has entered the gate")
	print(body)


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos 
	laser.rotation = direction.angle()
	laser.direction = direction
	$Projecttiles.add_child(laser)

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projecttiles.add_child(grenade)
