extends Node2D

export (PackedScene) var Main

func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")
	
func _on_Button2_pressed():
	get_tree().quit()

