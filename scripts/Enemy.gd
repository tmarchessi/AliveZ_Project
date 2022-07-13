extends KinematicBody2D

onready var bullet_spawn = $BulletSpawn
var Bullet = preload("res://Bullet.tscn")

func fire():
	var bullet = Bullet.instance()
	get_parent().add_child(bullet)
	bullet.global_position = bullet_spawn.global_position
