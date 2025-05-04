extends CharacterBody2D
var alive = true

const SPEED = 100.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if alive: 
		# Handle jump.
		if Input.is_action_just_pressed("p2_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("p2_left", "p2_right")
		if direction:
			velocity.x = direction * SPEED
			$Attack.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			$Attack.play("idle1")

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("game over")
		$Attack.play("death")
		alive = false
		$"../GameOver".gameover("Human Wins")
