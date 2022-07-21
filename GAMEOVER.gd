extends CanvasLayer




func _on_RESTART_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_EXIT_pressed():
	get_tree().quit()
