extends KinematicBody2D

export var WALK_FORCE = 600
export var  WALK_MAX_SPEED = 60
export var  STOP_FORCE = 1300
export var  JUMP_SPEED = 100
export var  gravity = 200

var velocity = Vector2()

var is_resetting = false

var can_control_jump = true
var can_control_left = true
var can_control_right = true

signal lose_jump_control
signal fix
signal lose_left_control
signal lose_right_control

func _physics_process(delta):
	var walk = get_walk_vector()
	if abs(walk) < WALK_FORCE * 0.2:
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	velocity.y += gravity * delta

	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	if is_on_floor():
		if !can_control_jump:
			do_jump()
		elif Input.is_action_just_pressed("jump"):
			can_control_jump = false
			emit_signal("lose_jump_control")
			do_jump()

func do_jump():
	velocity.y = -JUMP_SPEED

func get_walk_vector():
	var left = 0
	var right = 0
	if can_control_right:
		right = Input.get_action_strength("move_right")
		if (right != 0):
			can_control_right = false
			emit_signal("lose_right_control")
	else:
		right = 1
	if can_control_left:
		left = Input.get_action_strength("move_left")
		if (left != 0):
			can_control_left = false
			emit_signal("lose_left_control")
	else:
		left = 1
	return WALK_FORCE * (right - left)

func fix():
	can_control_jump = true
	can_control_left = true
	can_control_right = true
	emit_signal("fix")
