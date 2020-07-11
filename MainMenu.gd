extends Control

func _on_TextureButton_pressed():
	var level_one = load("res://Level1.tscn")
	get_tree().change_scene_to(level_one)
