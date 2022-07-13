extends MarginContainer

onready var play =  $PanelContainer/VBoxContainer/Play
onready var credits = $PanelContainer/VBoxContainer/Credits
onready var quit = $PanelContainer/VBoxContainer/Quit

func _ready():
	play.connect("pressed", self, "_on_play_pressed")
	credits.connect("pressed", self, "_on_credits_pressed")
	quit.connect("pressed", self, "_on_exit_pressed")

func _on_play_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_credits_pressed():
	get_tree().change_scene("res://Credits.tscn")

func _on_exit_pressed():
	get_tree().exit()
