extends Node

const SAVE_PATH := "res://my_save.tres"

var save_game : SaveGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		save_game = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)
	else:
		save_game = SaveGame.new()

func save() -> void:
	ResourceSaver.save(save_game, SAVE_PATH)

func load() -> void:
	for ball_data in save_game.balls_data:
		return
