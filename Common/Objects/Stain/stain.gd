extends Node2D

@export var area : Area2D
@export var stain_health : int
@export var sprite : Sprite2D 
@export var out_of_bounds_timer : Timer
@export var respawn_timer : Timer

var is_active : bool = true

@export var distance_label : Label

var being_cleaned : bool = false
var current_mouse_position : Vector2 = Vector2(480, 320)
var last_mouse_position : Vector2 = Vector2(576,325)

var flip : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if being_cleaned && abs(Input.get_last_mouse_screen_velocity().length()) >= 300:
		sprite.modulate.a -= 0.005
		distance_label.text = "cleaning"
	else:
		distance_label.text = ""
	queue_redraw()
	
	if sprite.modulate.a <= 0 && is_active:
		is_active = false
		respawn_timer.start()

# Old line tracking code
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton && event.is_pressed():
		#last_mouse_position = Global.mouse_position
	
		#draw_circle(last_mouse_position, 3, Color.BLACK)
		#draw_line(last_mouse_position, current_mouse_position, Color.RED, 5)
		#queue_redraw()

func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	being_cleaned = true
	out_of_bounds_timer.stop()
	pass # Replace with function body.

func _on_area_2d_mouse_shape_exited(shape_idx: int) -> void:
	out_of_bounds_timer.start()

func _on_timer_timeout() -> void:
	pass # Replace with function body.

func _on_out_of_bounds_timer_timeout() -> void:
	being_cleaned = false

func _on_respawn_timer_timeout() -> void:
	is_active = true
	sprite.modulate.a = 1
