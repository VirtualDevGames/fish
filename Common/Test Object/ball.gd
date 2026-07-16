extends Node2D
class_name Ball

var ball_data : BallData:
	set(value):
		ball_data = value
		apply_data()


## FIX BALL COLOR SPAWNING LOGIC 

#@onready var sprite_2d: Sprite2D = $Sprite2D
@export var sprite_2d : Sprite2D

var sprite_color : Color

# Called when the node enters the scene tree for the first time.
func _ready():
	if ball_data:
		apply_data()

func apply_data() -> void:
	sprite_2d.modulate = ball_data.color
	position = ball_data.position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	return
	#queue_free()
