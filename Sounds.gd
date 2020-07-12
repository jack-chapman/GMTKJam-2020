extends Node

func play_break():
	var player = get_player($BreakSounds)
	player.play()

func play_heal():
	var player = get_player($HealSounds)
	player.play()

func play_die():
	$Die.play()

func play_jump():
	var player = get_player($JumpSounds)
	player.play()

func get_player(node):
	var options = node.get_children()
	var choice = randi() % options.size()
	return options[choice]
