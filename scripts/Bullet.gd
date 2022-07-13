extends Area2D

var SPEED = 300	

func _ready():
	connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body: Node):
	print("F")
