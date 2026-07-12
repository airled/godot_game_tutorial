extends Area2D

@onready var char: CharacterBody2D = get_tree().current_scene.get_node("char")

func _on_body_entered(body: Node2D) -> void:
	if body == char:
		char.start_being_damaged()
	
func _on_body_exited(body: Node2D) -> void:
	if body == char:
		char.stop_being_damaged()
