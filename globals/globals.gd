extends Node

signal player_health_change
signal laser_amount_change
signal grenade_amount_change

var max_laser_amount = 20
var laser_amount = max_laser_amount:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		laser_amount_change.emit()


var max_grenade_amount = 5
var grenade_amount = max_grenade_amount:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		grenade_amount_change.emit()

var max_player_health = 100
var player_health = max_player_health:
	get:
		return player_health
	set(value):
		player_health = value	
		player_health_change.emit()

var player_pos: Vector2
