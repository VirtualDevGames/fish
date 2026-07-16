extends Node

var mouse_position : Vector2 = Vector2.ZERO
var camera : Camera2D
var viewport : Viewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = get_viewport().get_camera_2d()
	viewport = get_viewport()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_position = _get_mouse_position()

func _get_mouse_position() -> Vector2 :
	return get_viewport().get_mouse_position()

func _exit_tree() -> void:
	return
