extends Area2D

@onready var character: CharacterBody2D = $"../../../Character"

func _on_body_entered(body: Node2D) -> void:
	if body == character:
		character.start_being_damaged()
	
func _on_body_exited(body: Node2D) -> void:
	if body == character:
		character.stop_being_damaged()
