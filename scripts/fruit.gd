extends Area2D

@onready var game_manager: Node = get_tree().current_scene.get_node("manager")
@onready var char: CharacterBody2D = get_tree().current_scene.get_node("char")

const FRUIT_HP = 20

func _on_body_entered(body: Node2D) -> void:
	if body == char:
		game_manager.add_health(FRUIT_HP)
		queue_free()
