extends MarginContainer

onready var play =  $PanelContainer/VBoxContainer/Play
onready var quit = $PanelContainer/VBoxContainer/Quit
onready var credit = $PanelContainer/VBoxContainer/Button

func _ready():
	play.connect("pressed", self, "_on_play_pressed")
	quit.connect("pressed", self, "_on_exit_pressed")
	credit.connect("pressed", self, "_on_credit_pressed")

func _on_play_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_exit_pressed():
	get_tree().quit()
 
func _on_credit_pressed():
	get_tree().change_scene("res://Credits.tscn")
