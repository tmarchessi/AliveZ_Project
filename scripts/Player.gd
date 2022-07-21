extends KinematicBody2D

export(int) var speed = 100.0
var _facing_right = true

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
