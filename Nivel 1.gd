extends Node2D

const PauseScreen = preload("res://Pause.tscn")

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause"):
		var pause_menu = PauseScreen.instance()
		add_child(pause_menu)
