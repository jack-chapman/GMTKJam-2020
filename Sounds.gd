extends Node

var muted = false setget set_muted

func _ready():
	$Music.play()

func play_break():
	if muted:
		pass
	else:
		var player = get_player($BreakSounds)
		player.play()

func play_heal():
	if muted:
		pass
	else:
		var player = get_player($HealSounds)
		player.play()

func play_die():
	if muted:
		pass
	else:
		$Die.play()

func play_jump():
	if muted:
		pass
	else:
		var player = get_player($JumpSounds)
		player.play()

func get_player(node):
	var options = node.get_children()
	var choice = randi() % options.size()
	return options[choice]

func set_muted(val):
	if val:
		$Music.stop()
	else:
		$Music.play()
	muted = val


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		var menu = load("res://MainMenu.tscn")
		get_tree().change_scene_to(menu)

func toggle_mute():
	set_muted(!muted)
