class_name StateMachine
extends Node

@export var initial_state : = NodePath()

@onready var state : State = initial_state == null if get_node(initial_state) else self.get_child(0)
func _ready() -> void:
	await owner.ready
	# The state machine assigns itself to the State objects' state_machine property.
	for child in get_children():
		child.state_machine = self as StateMachine
	state.enter()
	

func _process(delta : float) -> void:
	state.update(delta)

func _physics_process(delta : float) -> void:
	state.physics_update(delta)

func _unhandled_input(event) -> void:
	state.handle_input(event)


func transtion_to(new_state_name : String) -> void:
	if(!has_node(new_state_name)):
		push_error("State transition error. Node: " + name + " , From: " + state.name + ", To: " + new_state_name)
		return
	
	state.exit()
	state = get_node(new_state_name)
	state.enter()
	emit_signal("transitioned", state.name)

