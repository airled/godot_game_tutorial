extends Node

@onready var ui: CanvasLayer = %UI

var coins = 0
var health = 100
var current_level_number = 1
var current_level

func _ready() -> void:
	var level1_scene: PackedScene = load("res://scenes/level1.tscn")
	var level1 = level1_scene.instantiate()
	add_child(level1)
	current_level = level1

func load_next_level():
	var next_level_number = current_level_number + 1
	var next_level_scene: PackedScene = load("res://scenes/level" + str(next_level_number) + ".tscn")
	var next_level = next_level_scene.instantiate()
	current_level_number = next_level_number
	remove_child(current_level)
	add_child(next_level)
	current_level = next_level	


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
