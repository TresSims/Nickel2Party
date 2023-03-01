extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 2.0

const INPUT_LEFT = 0
const INPUT_RIGHT = 1
const INPUT_UP = 2
const INPUT_DOWN = 3
const INPUT_PRIMARY = 4
const INPUT_SECONDARY = 5

var inputs = [0, 0, 0, 0, 0, 0]

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func set_inputs(new_inputs):
	inputs[INPUT_LEFT] = new_inputs[INPUT_LEFT]
	inputs[INPUT_RIGHT] = new_inputs[INPUT_RIGHT]
	inputs[INPUT_UP] = new_inputs[INPUT_UP]
	inputs[INPUT_DOWN] = new_inputs[INPUT_DOWN]
	inputs[INPUT_PRIMARY] = new_inputs[INPUT_PRIMARY]
	inputs[INPUT_SECONDARY] = new_inputs[INPUT_SECONDARY]


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if not velocity.is_zero_approx() and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Vector3(inputs[INPUT_RIGHT] - inputs[INPUT_LEFT], inputs[INPUT_DOWN] - inputs[INPUT_UP], 0)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func process_input(event):
	if event.is_action_pressed("primary"):
		inputs[INPUT_PRIMARY] = 1
	elif event.is_action_released("primary"):
		inputs[INPUT_PRIMARY] = 0
	if event.is_action_pressed("secondary"):
		inputs[INPUT_SECONDARY] = 1
	elif event.is_action_released("secondary"):
		inputs[INPUT_SECONDARY] = 0
	if event.is_action_pressed("up"):
		inputs[INPUT_UP] = 1
	elif event.is_action_released("up"):
		inputs[INPUT_UP] = 0
	if event.is_action_pressed("down"):
		inputs[INPUT_DOWN] = 1
	elif event.is_action_released("down"):
		inputs[INPUT_DOWN] = 0
	if event.is_action_pressed("left"):
		inputs[INPUT_LEFT] = 1
	elif event.is_action_released("left"):
		inputs[INPUT_LEFT] = 0
	if event.is_action_pressed("right"):
		inputs[INPUT_RIGHT] = 1
	elif event.is_action_released("right"):
		inputs[INPUT_RIGHT] = 0
