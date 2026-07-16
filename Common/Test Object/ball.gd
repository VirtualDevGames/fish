extends Node2D
class_name Ball

var ball_data : BallData:
	set(value):
		ball_data = value
		if ball_data:
			if ball_data.color != Color.BLACK:
				sprite_2d.modulate = value.color
			position = value.position
		else:
			get_rand_color()

## FIX BALL COLOR SPAWNING LOGIC 

#@onready var sprite_2d: Sprite2D = $Sprite2D
@export var sprite_2d : Sprite2D

var sprite_color : Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ball_data == null:
		ball_data = BallData.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_rand_color() -> void:
	match randi_range(0, 3) :
		0:
			sprite_color = Color.RED
		1:
			sprite_color = Color.BLUE
		2:
			sprite_color = Color.GREEN
		3:
			sprite_color = Color.YELLOW
			
	sprite_2d.modulate = sprite_color
	ball_data.color = sprite_color
	print()

func _on_timer_timeout() -> void:
	return
	#queue_free()
