extends Node2D

var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 20

func _ready():
	
	look_vec = player.position - global_position

func _physics_process(delta):
	
	move = Vector2.ZERO
	move = move.move_toward(look_vec,delta)
	move = move.normalized() * speed
	position += move


func _on_bullet_area_body_entered(body):
	if body.name == "cliff":
		queue_free()
