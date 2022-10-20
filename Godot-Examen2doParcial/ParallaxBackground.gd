extends ParallaxBackground

export var playing = false
export var nube_speed = 100
export var camino_speed = 500

func _process(delta):
	if playing:
		$Nubes.motion_offset += Vector2.LEFT * nube_speed * delta
		$Camino.motion_offset += Vector2.LEFT * camino_speed * delta
