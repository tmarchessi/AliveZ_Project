extends KinematicBody2D

var granada = null
var move = Vector2.ZERO
var speed = 1
var granadas = []
export var max_health = 6
var health = max_health

func _physics_process(delta):
	move = Vector2.ZERO
	if granada != null:
		move = position.direction_to(granada.position) * speed
	else:
		move = Vector2.ZERO
		
		
	move = move.normalized()
	move = move_and_collide(move)

func _on_Area2D_area_entered(area):
	if area != self and (area.name == "granada"):
		granadas.append(area)
		granada = granadas[-1]
		print(granada)

func _on_Area2D_area_exited(area):
	if (area.name == "granada"):
		granadas.erase(area)
		if granadas.empty():
			granada = null
		else:
			granada = granadas[-1]


func _on_dead_area_entered(area):
	if (area.name == "bullet_area"):
		health -= 3
		if health <= 0:
			health = 0
			area.get_parent().queue_free()
			queue_free()
		area.get_parent().queue_free()

