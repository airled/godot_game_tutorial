extends Area2D

@onready var manager: Node = get_tree().current_scene.get_node("Manager")

const HP = 20

func _on_body_entered(body: Node2D) -> void:
	$AudioStreamPlayer2D.play()
	$BottleRemoveTimer.start()
	remove_child($CollisionShape2D)
	visible = false
	manager.add_health(HP)

func _on_bottle_remove_timer_timeout() -> void:
	queue_free()
