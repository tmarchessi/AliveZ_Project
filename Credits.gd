extends MarginContainer

onready var back = $PanelContainer/TextEdit/CenterContainer/Button

func _ready():
	back.connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
