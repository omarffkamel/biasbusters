extends KinematicBody2D

var speed = 200
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = Vector2.ZERO  # Reset velocity each frame

	# Horizontal movement
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		$AnimatedSprite.play("Walking")
		$AnimatedSprite.flip_h = false  # Ensure the sprite faces right
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		$AnimatedSprite.play("Walking")
		$AnimatedSprite.flip_h = true  # Flip the sprite to face left
	
	# Vertical movement
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
		$AnimatedSprite.play("Walking")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= speed
		$AnimatedSprite.play("Walking")

	# Idle animation when not moving
	if velocity == Vector2.ZERO:
		$AnimatedSprite.play("Idle")

	# Apply movement
	velocity = move_and_slide(velocity)
