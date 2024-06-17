extends Node2D
class_name LevelBase

var laser_scene: PackedScene = preload("res://scenes/projecttiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projecttiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for item_container in get_tree().get_nodes_in_group("item_container"):
		item_container.connect("open", _on_item_container_opened)

	for scout in get_tree().get_nodes_in_group("scouts"):
		scout.connect("laser", _on_scout_laser)

func _on_player_laser(pos, direction):
	create_laser(pos, direction)

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projecttiles.add_child(grenade)


func _on_house_player_entered_house():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player, "modulate:a", 0.5, 2).from(0.5)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)


func _on_house_player_exited_house():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($Player, "modulate:a", 1, 2)

func _on_item_container_opened(pos:Vector2, dir: Vector2):
	var item = item_scene.instantiate() as Area2D
	item.position = pos
	item.direction = dir
	$Items.call_deferred("add_child", item)

func _on_scout_laser(pos: Vector2, dir: Vector2):
	create_laser(pos, dir, Color(0.5, 0, 0, 1))

func create_laser(pos: Vector2, dir: Vector2, clr: Color = Color(1, 1, 1, 1)):
	var laser = laser_scene.instantiate() as Area2D
	laser.modulate = clr 
	laser.position = pos
	laser.rotation = dir.angle()
	laser.direction = dir
	$Projecttiles.add_child(laser)
