extends Area2D

var ignore = false

func reset():
	$Sprite.visible = true
	ignore = false

func _on_Heal_body_entered(body):
	if ignore:
		pass
	else:
		print('hit')
		body.fix()
		$Sprite.visible = false
		ignore = true
