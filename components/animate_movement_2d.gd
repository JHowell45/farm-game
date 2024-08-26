extends Node

var direction: DirectionEnum

enum DirectionEnum {LEFT, RIGHT, UP, DOWN}

func animate_movement(velocity: Vector2, animator: AnimationPlayer):
	if velocity.x < 0:
		animator.play("Left running")
		direction = DirectionEnum.LEFT
		return
	if velocity.x > 0:
		animator.play("Right running")
		direction = DirectionEnum.RIGHT
		return
	if velocity.y < 0:
		animator.play("Backward running")
		direction = DirectionEnum.UP
		return
	if velocity.y > 0:
		animator.play("Forward running")
		direction = DirectionEnum.DOWN
		return
	if velocity.is_zero_approx():
		print("ZERO")
		match direction:
			DirectionEnum.LEFT:
				animator.play("Left stationary")
			DirectionEnum.RIGHT:
				animator.play("Right stationary")
			DirectionEnum.UP:
				animator.play("Backward stationary")
			DirectionEnum.DOWN:
				animator.play("Forward stationary")
		
