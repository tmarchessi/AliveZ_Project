extends KinematicBody2D

onready var bullets = preload("res://Bullet.tscn")

var player = null
var move = Vector2.ZERO
var speed = 1

func _on_DetectionArea_body_entered(body):
	if body != self:
		player = body


func _on_DetectionArea_body_exited(body):
	player=null
	
func fire():
	var bullet = bullets.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)
	
func _on_Timer_timeout():
	if player != null:
		fire()
