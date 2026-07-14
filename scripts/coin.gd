extends Area2D

@onready var manager: Node = get_tree().current_scene.get_node("Manager")

func _on_body_entered(body: Node2D) -> void:
	manager.add_coin()
	$AnimationPlayer.play('pickup')
