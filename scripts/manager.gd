extends Node

@onready var ui: CanvasLayer = $"../ui"

var coins = 0
var health = 100

func restart_game():
	get_tree().reload_current_scene()

func add_coin():
	coins += 1
	ui.get_node('coins').text = 'Coins: ' + str(coins)

func add_health(val: int):
	health = min(health + val, 100)
	ui.get_node('hp').text = 'HP: ' + str(int(health))

func reduce_health(damage: float):
	health -= damage
	ui.get_node('hp').text = 'HP: ' + str(int(health))
	if health <= 0:
		restart_game()
