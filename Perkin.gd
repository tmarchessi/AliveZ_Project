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
	print(area.get_parent().name)
	if area != self and (area.get_parent().name == "YSort"):
		granada = area

func _on_Area2D_area_exited(area):
	granada = null
