extends Node2D

var start =  false
var Tree = preload("res://scenes/characters/Obstaculos.tscn")
var Vuela = preload("res://scenes/characters/Volador.tscn")
var score
var time=5

func _process(delta):
	if !start:
		if Input.is_action_just_pressed("jump"):
			start = true
			$Dino.start = true
			$ParallaxBackground.playing = true
			$Timer.start()

func _on_Timer_timeout():
	arbolito()
	dino_vol()
	
func arbolito():
	var tree = Tree.instance()
	tree.position = Vector2(1000, 243)
	tree.start = true
	tree.connect("body_entered", self, "game_over")
	add_child(tree)
	
func dino_vol():
	var volador = Vuela.instance()
	volador.position = Vector2(700, 243)
	volador.start = true
	volador.connect("body_entered", self, "game_over")
	add_child(volador)

func game_over(body):
	$Reiniciar.show()
	$Label.show()
	print("Game Over")
	$Timer.stop()
	$ParallaxBackground.playing = false
	$Dino.start = false
	#$CanvasLayer/Label.start = false
	var trees = get_tree().get_nodes_in_group('tree')
	for tree in trees:
		tree.start = false
		
	var voladores = get_tree().get_nodes_in_group('vol')
	for vol in voladores:
		vol.start = false

func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		get_tree().reload_current_scene()
		
func _physics_process(delta: float) -> void:
	time += delta * 10
	score = "%05d"%[time]
	$CanvasLayer/Label.text=score
