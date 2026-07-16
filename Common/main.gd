extends Node2D

const ball_scene = preload("uid://d4l66j6m0mgeq")

@export var ball_list : Array[Ball] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_instance_valid(SaveLoad):
		if is_instance_valid(SaveLoad.save_game):
			load_balls_from_save()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var new_ball_data = BallData.new()
		new_ball_data.position = Global.mouse_position
		var new_ball = spawn_ball(new_ball_data)
		
		SaveLoad.save_game.balls_data.push_back(new_ball.ball_data)
		
		print("list size: " + str(ball_list.size()))
		if ball_list.size() > 3:
			var object_to_remove = ball_list.pop_front()
			SaveLoad.save_game.balls_data.pop_front()
			if is_instance_valid(object_to_remove):
				object_to_remove.queue_free()
		
		SaveLoad.save()

func load_balls_from_save() -> void:
	for load_ball_data in SaveLoad.save_game.balls_data:
		var new_ball : Ball = ball_scene.instantiate()
		add_child(new_ball)
		print(str(load_ball_data.position) + " " + str(load_ball_data.color))
		new_ball.ball_data = load_ball_data
		
		ball_list.push_back(new_ball)

func spawn_ball(_ball_data : BallData = null) -> Ball:
	var new_ball : Ball = ball_scene.instantiate()
	add_child(new_ball)
	if _ball_data:
		new_ball.ball_data = _ball_data
		
	ball_list.push_back(new_ball)
	
	return new_ball
