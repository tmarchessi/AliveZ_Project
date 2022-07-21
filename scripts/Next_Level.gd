extends Area2D

func _on_Area2D_area_entered(area):
	if area != self and area.name == "player_area":
		get_tree().quit()
