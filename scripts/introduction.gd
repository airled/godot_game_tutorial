extends CanvasLayer

@onready var manager: Node = get_tree().current_scene.get_node("Manager")

func _ready() -> void:
	$ColorRect/Label.text = "Level " + str(manager.current_level_number)
