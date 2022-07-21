extends KinematicBody2D

var player = null
onready var BULLET_SCENE = preload("res://bulletnuevo.tscn")

func _on_Area2D_body_entered(body):
	if body != self:
		player = body


func _on_Area2D_body_exited(body):
	player = null


func _on_Timer_timeout():
	if player != null:
		fire()

func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)
