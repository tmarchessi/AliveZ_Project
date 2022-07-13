extends Area2D

var SPEED = 150
var FRICTION = 0.6
var STARTPOS = Vector2.ZERO
var DIRECTION = Vector2.ZERO

func _ready():
	connect("body_entered", self, "_on_body_entered")
	STARTPOS = position
	
func _on_body_entered(body: Node):
	print("F")
	
func _physics_process(delta):
	if SPEED > 0:
		SPEED -= FRICTION
		position += SPEED*transform.x*delta
	else:
		pass
	var dist = abs(cartesian2polar(position.x - STARTPOS.x,position.y - STARTPOS.y).x)

func _on_Timer_timeout():
	queue_free()
