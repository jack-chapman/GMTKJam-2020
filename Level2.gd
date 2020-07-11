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
	# load level 3
	print('finished l2')


func _on_Kill_body_entered(body):
	body.fix()
	body.velocity = Vector2.ZERO
	body.global_position = player_spawn.global_position

func _input(event):
	if (event.is_action_pressed('reset')):
		var player = $Player
		player.fix()
		player.velocity = Vector2.ZERO
		player.global_position = player_spawn.global_position
