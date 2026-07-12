extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycast_left: RayCast2D = $raycast_left
@onready var raycast_right: RayCast2D = $raycast_right

const SPEED = 50
var direction = 1;

func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		animated_sprite.flip_h = true
		direction = -1
	elif raycast_left.is_colliding():
		animated_sprite.flip_h = false
		direction = 1

	position.x += direction * SPEED * delta
