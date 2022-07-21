extends CanvasLayer




func _on_RESTART_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Main.tscn")


func _on_EXIT_pressed():
	get_tree().quit()


func _on_MAIN_MENU_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu.tscn")
