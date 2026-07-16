extends Fish_State

@onready var idle_timer: Timer = $"Idle Timer"

### This is the state base class. It should be extended by all states.
### States should be added as children to the state machine.
### How to use: Call Transitioned with params "self" and the name of the state to transition to.
### Example: Transitioned.emit(self, "Idle")
### The state machine will handle the rest.

func Enter():
	idle_timer.start()

func Exit():
	pass

func Update(_delta : float):
	pass

func Physics_Update(_delta : float):
	pass

func _on_idle_timer_timeout() -> void:
	Transitioned.emit(self, "Move")
