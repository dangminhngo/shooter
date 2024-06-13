extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var player_health_progress: TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready():
	laser_label.text = str(Globals.laser_amount)
	grenade_label.text = str(Globals.grenade_amount)
	player_health_progress.value = Globals.player_health	

func update_laser_label():
	laser_label.text = str(Globals.laser_amount)

func update_grenade_label():
	grenade_label.text = str(Globals.grenade_amount)

func update_player_health_percentage():
	player_health_progress.value = Globals.player_health	

