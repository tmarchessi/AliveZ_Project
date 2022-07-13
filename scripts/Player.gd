extends KinematicBody2D

export(int) var speed = 80.0
var _facing_right = true

onready var playback =$AnimationTree.get("parameters/playback")

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1.0
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1.0
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1.0
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1.0
	
	#Animations
	if abs(velocity.x) > 0 or abs(velocity.y) > 0:
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
