extends KinematicBody2D

onready var bullet_spawn = $BulletSpawn
var Bullet = preload("res://Bullet.tscn")

func _on_area_area_entered(area):
	if area.is_in_group("zombie"):
		$Enemy.fire(area.global_position)

func fire():
	var bullet = Bullet.instance()
	get_parent().add_child(bullet)
	bullet.global_position = bullet_spawn.global_position
