extends MarginContainer

onready var number_label = $Bars/LifeBar/Count/background/Number
onready var bar = $Bars/LifeBar/TextureProgress
onready var tween = $Tween


func _ready():
	var player_hp = $"../YSort/Player".max_health
	bar.max_value = player_hp
	pass


func _on_Player_health_changed():
	pass # Replace with function body.
