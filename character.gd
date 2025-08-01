extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
var last_direction = "down" 
var pressed = false
const SPEED = 250

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("right") or Input.is_key_pressed(KEY_D):
		input_vector.x += 1
	if Input.is_action_pressed("left") or Input.is_key_pressed(KEY_A):
		input_vector.x -= 1
	if Input.is_action_pressed("down") or Input.is_key_pressed(KEY_S):
		input_vector.y += 1
	if Input.is_action_pressed("up") or Input.is_key_pressed(KEY_W):
		input_vector.y -= 1

	input_vector = input_vector.normalized()

	velocity = input_vector * SPEED
	move_and_slide()
	
	if global_position.x >=295 and global_position.x < 350 and Input.is_action_just_pressed("interact"):
		global_position = Vector2(2468.0, -957.0)


		

	if input_vector != Vector2.ZERO:

		if abs(input_vector.y) > abs(input_vector.x):
			last_direction = "up" if input_vector.y < 0 else "down"
		else:
			last_direction = "left" if input_vector.x < 0 else "right"

		sprite.animation = "walk_" + last_direction
		sprite.play()
	else:
		sprite.animation = "idle_" + last_direction
		sprite.play()
