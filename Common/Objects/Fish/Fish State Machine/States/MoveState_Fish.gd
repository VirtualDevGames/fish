extends Fish_State

### This is the state base class. It should be extended by all states.
### States should be added as children to the state machine.
### How to use: Call Transitioned with params "self" and the name of the state to transition to.
### Example: Transitioned.emit(self, "Idle")
### The state machine will handle the rest.

var speed : float = 200
var has_walked : bool

func _ready() -> void:
	call_deferred("NavigationSetup")
	#fish.navigation_agent.velocity_computed.connect(NavigationSetup)

func Enter():
	pass

func Exit():
	has_walked = false
	fish.velocity = Vector2.ZERO

func Update(_delta : float):
	pass

func Physics_Update(_delta : float):
	if fish.navigation_agent.is_navigation_finished():
		if has_walked:
			#if randi_range(0, 1) == 1:
			#print("Nav agent reached destination")
			Transitioned.emit(self, "idle")
			return
		SetMovementTarget()
		return

	var target_position = fish.navigation_agent.get_next_path_position()
	var target_direction = fish.global_position.direction_to(target_position)
	fish.anim_sprite.flip_h = target_direction.x < 0
	fish.velocity = target_direction * speed

func SetMovementTarget():
	var target_position : Vector2 = NavigationServer2D.map_get_random_point(fish.navigation_agent.get_navigation_map(), fish.navigation_agent.navigation_layers, false)
	fish.navigation_agent.target_position = target_position
	#print(target_position)
	has_walked = true

func NavigationSetup():
	await get_tree().physics_frame
	await get_tree().physics_frame
	await get_tree().physics_frame
	await get_tree().physics_frame
	SetMovementTarget()
