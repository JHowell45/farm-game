extends Node

var direction: DirectionEnum

enum DirectionEnum {LEFT, RIGHT, BACK, FORWARD}

func animate_movement(velocity: Vector3, animator: AnimationPlayer):
	if velocity.x < 0:
		animator.play("Left running")
		direction = DirectionEnum.LEFT
		return
	if velocity.x > 0:
		animator.play("Right running")
		direction = DirectionEnum.RIGHT
		return
	if velocity.z < 0:
		animator.play("Backward running")
		direction = DirectionEnum.BACK
		return
	if velocity.z > 0:
		animator.play("Forward running")
		direction = DirectionEnum.FORWARD
		return
	if velocity.is_zero_approx():
		match direction:
			DirectionEnum.LEFT:
				animator.play("Left stationary")
			DirectionEnum.RIGHT:
				animator.play("Right stationary")
			DirectionEnum.BACK:
				animator.play("Backward stationary")
			DirectionEnum.FORWARD:
				animator.play("Forward stationary")
		
