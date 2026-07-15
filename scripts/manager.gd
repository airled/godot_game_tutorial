extends Node

@onready var ui: CanvasLayer = %UI

var coins = 0
var health = 100
var current_level_number = 1
var current_level

func _ready() -> void:
	_load_level(1)

func load_next_level():
	var next_level_number = current_level_number + 1
	_load_level(next_level_number)

func restart_game():
	get_tree().reload_current_scene()

func add_coin():
	coins += 1
	ui.get_node('Coins').text = 'Coins: ' + str(coins)

func add_health(val: int):
	health = min(health + val, 100)
	ui.get_node('HP').text = 'HP: ' + str(int(health))

func reduce_health(damage: float):
	health -= damage
	ui.get_node('HP').text = 'HP: ' + str(int(health))
	if health <= 0:
		restart_game()

func _load_level(level_number: int) -> void:
	current_level_number = level_number
	var level_scene: PackedScene = load("res://scenes/levels/level" + str(level_number) + ".tscn")
	var level = level_scene.instantiate()
	if current_level:
		remove_child(current_level)
	add_child(level)
	current_level = level
	current_level_number = level_number
	ui.get_node('Level').text = 'Level: ' + str(level_number)
