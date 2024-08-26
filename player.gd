extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 50
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

@export var sprint_multiplier = 2.5

var target_velocity = Vector3.ZERO

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var animate = %AnimateMovement3D

func _physics_process(delta):
	var direction = Vector3.ZERO
	var local_speed = speed
	if Input.is_action_pressed("sprint"):
		print("pressed")
		local_speed *= sprint_multiplier
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("back"):
		direction.z += 1
	if Input.is_action_pressed("forward"):
		direction.z -= 1
	if not direction.is_zero_approx():
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)
	
	# Ground Velocity
	target_velocity.x = direction.x * local_speed * delta
	target_velocity.z = direction.z * local_speed * delta

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	print(velocity)
	
	animate.animate_movement(velocity, animator)
