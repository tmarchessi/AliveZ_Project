extends KinematicBody2D

var granada = null
var move = Vector2.ZERO
var speed = 1

func _physics_process(delta):
	move = Vector2.ZERO
	if granada != null:
		move = position.direction_to(granada.position) * speed
	else:
		move = Vector2.ZERO
		
		
	move = move.normalized()
	move = move_and_collide(move)

func _on_Area2D_area_entered(area):
	print(area.name)
	if area != self and (area.name == "granada"):
		granada = area

func _on_Area2D_area_exited(area):
	if (area.name == "granada"):
		granada = null


func _on_dead_area_entered(area):
	if (area.name == "bullet_area"):
		area.get_parent().queue_free()
		queue_free()
	pass
