extends KinematicBody2D

export var WALK_FORCE = 600
export var  WALK_MAX_SPEED = 60
export var  STOP_FORCE = 1300
export var  JUMP_SPEED = 100
export var  gravity = 200

var velocity = Vector2()

func _physics_process(delta):
	var walk = WALK_FORCE * (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))
	if abs(walk) < WALK_FORCE * 0.2:
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	velocity.y += gravity * delta

	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED
