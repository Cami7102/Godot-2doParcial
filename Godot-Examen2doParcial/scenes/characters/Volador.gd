extends Area2D

var start =  false
var speed = 700

func _process(delta):
	if start:
		position += Vector2.LEFT * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free() 
