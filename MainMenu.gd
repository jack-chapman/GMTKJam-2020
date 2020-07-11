extends Control

func _on_TextureButton_pressed():
	var level_one = load("res://Game.tscn")
	get_tree().change_scene_to(level_one)
