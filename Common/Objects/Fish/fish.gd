extends CharacterBody2D
class_name Fish

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var anim_sprite : Sprite2D = $Sprite2D
@onready var sprites_anchor: Node2D = $"Sprites Anchor"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# temporarily flipping the sprites. delete this shit nephew
	if anim_sprite.flip_h:
		sprites_anchor.scale.x = -1
	else:
		sprites_anchor.scale.x = 1

func _physics_process(_delta):
	move_and_slide()

func _pick_move_location() -> Vector2:
	return Vector2.ZERO
