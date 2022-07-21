extends KinematicBody2D

var player = null
onready var BULLET_SCENE = preload("res://bulletnuevo.tscn")
var bodies = []

func _on_Area2D_body_entered(body):
	print(body)
	if body != self and body.name[0] !="E" and body.name !="cliff":
		bodies.append(body)
		player = bodies[0]
		print(bodies)


func _on_Area2D_body_exited(body):
	bodies.erase(body)
	if bodies.empty():
		player = null
	else:
		player = bodies[0]
	print(bodies)
	


func _on_Timer_timeout():
	if player != null:
		fire()

func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)
