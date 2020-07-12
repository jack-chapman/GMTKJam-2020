extends Control

var is_muted = false

func _ready():
	is_muted = Sounds.muted

func _on_TextureButton_pressed():
	var level_one = load("res://Level1.tscn")
	get_tree().change_scene_to(level_one)

func _input(event):
	if event.is_action_pressed("mute"):
		Sounds.toggle_mute()
		is_muted = Sounds.muted
		if is_muted:
			$Sprite.frame = 1
		else:
			$Sprite.frame = 0
