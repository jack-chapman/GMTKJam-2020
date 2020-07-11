extends Node

onready var left_arrow = $CanvasLayer/LeftArrow
onready var right_arrow = $CanvasLayer/RightArrow
onready var jump_arrow = $CanvasLayer/JumpArrow



func _on_Player_lose_right_control():
	right_arrow.play()



func _on_Player_lose_left_control():
	left_arrow.play()

func _on_Player_lose_jump_control():
	jump_arrow.play()


func _on_Player_fix():
	right_arrow.stop()
	right_arrow.frame = 0
	left_arrow.stop()
	left_arrow.frame = 0
	jump_arrow.stop()
	jump_arrow.frame = 0


func _on_Finish_body_entered(_body):
	var level_two = load("res://Level2.tscn")
	get_tree().change_scene_to(level_two)
