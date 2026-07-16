extends State

### This is the state base class. It should be extended by all states.
### States should be added as children to the state machine.
### How to use: Call Transitioned with params "self" and the name of the state to transition to.
### Example: Transitioned.emit(self, "Idle")
### The state machine will handle the rest.

func Enter():
	pass

func Exit():
	pass

func Update(_delta : float):
	pass

func Physics_Update(_delta : float):
	pass
