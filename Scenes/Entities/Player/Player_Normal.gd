extends State


func enter(values : Dictionary) -> void:
	pass

func handle_input(event : InputEvent) -> void:
	if(event.is_action("ACTION_THROWRIGHT")):
		state_machine.transtion_to("Player_PotionThrown", {"Direction": Vector2.RIGHT})
	if(event.is_action("ACTION_THROWLEFT")):
		state_machine.transtion_to("Player_PotionThrown", {"Direction": Vector2.LEFT})
	if(event.is_action("ACTION_THROWUP")):
		state_machine.transtion_to("Player_PotionThrown", {"Direction": Vector2.UP})
	if(event.is_action("ACTION_THROWDOWN")):
		state_machine.transtion_to("Player_PotionThrown", {"Direction": Vector2.DOWN})

func update(delta : float) -> void:
	pass

func physics_update(delta : float) -> void:
	pass


func exit() -> void:
	pass
