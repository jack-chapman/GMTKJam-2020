extends GridContainer

onready var label_jump = $label_jump
onready var label_left = $label_left
onready var label_right = $label_right

# Called when the node enters the scene tree for the first time.
func _ready():
	label_jump.text = 'JUMP: YES'
	label_left.text = 'LEFT: YES'
	label_right.text = 'RIGHT: YES'


func _on_Player_lose_jump_control():
	label_jump.text = 'JUMP: NO'


func _on_Player_fix():
	label_jump.text = 'JUMP: YES'
	label_left.text = 'LEFT: YES'
	label_right.text = 'RIGHT: YES'


func _on_Player_lose_left_control():
	label_left.text = 'LEFT: NO'


func _on_Player_lose_right_control():
	label_right.text = 'RIGHT: NO'
