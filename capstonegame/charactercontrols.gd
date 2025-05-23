extends CharacterBody2D




var running = false 
const SPEED = 600.0
const JUMP_VELOCITY = -600.0

func _ready() -> void:
	position = Vector2(660,200)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("p1_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("p1_left", "p1_right")
	if direction:
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		if not running:
			$AnimatedSprite2D.play("walk")
	else: 
		$AnimatedSprite2D.play("idle")
	velocity.x = direction * SPEED 
	move_and_slide()

	if Input.is_action_just_pressed("sprint"):
		$AnimatedSprite2D.play("run")
		running = true
	if Input.is_action_just_released("sprint"): 
		running = false
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite2D.play("attack")	
	
