extends Node

onready var left_arrow = $CanvasLayer/LeftArrow
onready var right_arrow = $CanvasLayer/RightArrow
onready var jump_arrow = $CanvasLayer/JumpArrow

onready var player_spawn = $PlayerSpawn



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


func _on_Kill_body_entered(_body):
	Sounds.play_die()
	reset_level()

func _input(event):
	if (event.is_action_pressed('reset')):
		reset_level()
	if event.is_action_pressed("mute"):
		Sounds.toggle_mute()


func reset_level():
	var player = $Player
	player.is_resetting = true
	player.fix()
	player.velocity = Vector2.ZERO
	player.global_position = player_spawn.global_position

	# reinstate heal(s)
	$Heal.reset()

	player.is_resetting = false
