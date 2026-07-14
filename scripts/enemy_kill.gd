extends AnimatableBody2D

const SPEED = 100

var direction = 1;

func _process(delta: float) -> void:
	if $RaycastRight.is_colliding():
		$AnimatedSprite2D.flip_h = true
		direction = -1
	elif $RaycastLeft.is_colliding():
		$AnimatedSprite2D.flip_h = false
		direction = 1

	position.x += direction * SPEED * delta
