extends Area2D

var start =  false
onready var speed = get_parent().get_node("ParallaxBackground").camino_speed

func _process(delta):
	if start:
		position += Vector2.LEFT * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
