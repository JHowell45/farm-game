extends CharacterBody2D

const SPEED = 25000

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var animate = %AnimateMovement2D

@onready var last_velocity: Vector2 = Vector2.ZERO
@onready var current_velocity: Vector2 = Vector2.ZERO

var flipping: bool = false

func _physics_process(delta):
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED * delta
	move_and_slide()
	
	animate.animate_movement(velocity, animator)
