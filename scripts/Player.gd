extends KinematicBody2D

signal health_changed
signal died

export(int) var speed = 100
var _facing_right = true
export var max_health = 10
var health = max_health
enum STATES {ALIVE,DEAD}
var state = STATES.ALIVE

onready var playback =$AnimationTree.get("parameters/playback")
onready var granade_spawn = $GranadeSpawn
var Granade = preload("res://Granade.tscn")

func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	var has_fired = false
	if Input.is_action_just_pressed("fire"):
		playback.travel("zombie_attack")
		has_fired= true 
	
	#Animations
	if not has_fired:
		if velocity != Vector2.ZERO:
			playback.travel("zombie_walk")
		else:
			playback.travel("zombie_idle")
	
	if Input.is_action_just_pressed("ui_left") and _facing_right:
		_facing_right = false
		scale.x = -1
	if Input.is_action_just_pressed("ui_right") and not _facing_right:
		_facing_right = true
		scale.x = -1
	move_and_slide(velocity * speed)

func throw():
	var granade = Granade.instance()
	granade.name = "granada"
	get_parent().add_child(granade)
	granade.global_position = granade_spawn.global_position 
	if not _facing_right:
		granade.rotation = PI 


func _on_Area2D_area_entered(area):
	if state == STATES.DEAD:
		return
	if (area.name == "bullet_area"):
		health -= 3
		if health <= 0:
			health = 0
			state = STATES.DEAD
			emit_signal("died")
			area.get_parent().queue_free()
			queue_free()
			get_tree().change_scene("res://GAMEOVER.tscn")
		area.get_parent().queue_free()
		emit_signal("health_changed", health)
	if (area.name == "Salida"):
		get_tree().change_scene("res://Nivel 2.tscn")
	if (area.name == "Salida2"):
		get_tree().change_scene("res://Credits.tscn")
	pass

