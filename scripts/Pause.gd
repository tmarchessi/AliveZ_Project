extends CanvasLayer


func _input(evecnt):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused 
