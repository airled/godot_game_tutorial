extends CharacterBody2D

@onready var game_manager: Node = get_tree().current_scene.get_node("manager")
@onready var char_animation: AnimatedSprite2D = $AnimatedSprite2D

const DAMAGE_PER_SEC = 40
const SPEED = 200.0
const JUMP_VELOCITY = -250.0

var can_double_jump = true
var being_damaged = false

func start_being_damaged():
	being_damaged = true
	
func stop_being_damaged():
	being_damaged = false

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	if being_damaged:
		game_manager.reduce_health(DAMAGE_PER_SEC * delta)

	# animation
	if being_damaged:
		char_animation.play('damage')
	elif not is_on_floor():
		char_animation.play('jump')
	elif direction:
		char_animation.play('run')
	else:
		char_animation.play('idle')

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		can_double_jump = true
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("jump") and !is_on_floor() and velocity.y < 200:
		if can_double_jump:
			velocity.y = JUMP_VELOCITY
			can_double_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction > 0:
		char_animation.flip_h = false
	elif direction < 0:
		char_animation.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
