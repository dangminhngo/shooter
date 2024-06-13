extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var player_health_progress: TextureProgressBar = $MarginContainer/TextureProgressBar

var ui_colors = {
	"green": Color("6bbfa3"),
	"red": Color(0.9, 0, 0, 1),
	"orange": Color("ff7d29"),
}


func _ready():
	laser_label.text = str(Globals.laser_amount)
	grenade_label.text = str(Globals.grenade_amount)
	player_health_progress.value = Globals.player_health	
	update_ui_color(Globals.laser_amount, Globals.max_laser_amount, laser_label, laser_icon)
	update_ui_color(Globals.grenade_amount, Globals.max_grenade_amount, grenade_label, grenade_icon)


func update_ui_laser() -> void:
	laser_label.text = str(Globals.laser_amount)
	update_ui_color(Globals.laser_amount, Globals.max_laser_amount, laser_label, laser_icon)


func update_ui_grenade() -> void:
	grenade_label.text = str(Globals.grenade_amount)
	update_ui_color(Globals.grenade_amount, Globals.max_grenade_amount, grenade_label, grenade_icon)

func update_player_health_percentage():
	player_health_progress.value = Globals.player_health	

func update_ui_color(amount: int, max_amount: int, label: Label, icon: TextureRect) -> void:
	@warning_ignore("integer_division")
	var warning_amount: int = floor(max_amount / 2)
	if amount > warning_amount:
		label.modulate = ui_colors["green"]
		icon.modulate = ui_colors["green"]
	elif amount <= warning_amount and amount > 0:
		label.modulate = ui_colors["orange"]
		icon.modulate = ui_colors["orange"]
	else:
		label.modulate = ui_colors["red"]
		icon.modulate = ui_colors["red"]
