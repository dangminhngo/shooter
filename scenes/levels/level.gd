extends Node2D
class_name LevelBase

var laser_scene: PackedScene = preload("res://scenes/projecttiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projecttiles/grenade.tscn")

func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos 
	laser.rotation = direction.angle()
	laser.direction = direction
	$Projecttiles.add_child(laser)
	$UI.update_laser_label()

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projecttiles.add_child(grenade)
	$UI.update_grenade_label()


func _on_house_player_entered_house():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player, "modulate:a", 0.5, 2).from(0.5)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)


func _on_house_player_exited_house():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($Player, "modulate:a", 1, 2)
