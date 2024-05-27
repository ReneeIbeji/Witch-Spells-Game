extends State

func enter(values : Dictionary) -> void:
	print(values["Direction"])
	GameVariables.PlayerNode.PotionThrowerSystem.throw(values["Direction"])
	GameVariables.PlayerNode.knockback(values["Direction"] * -1,4,1)
	var countdown = get_tree().create_timer(3)
	countdown.timeout.connect(cooldownEnd)

func handle_input(event : InputEvent) -> void:
	pass

func update(delta : float) -> void:
	pass

func physics_update(delta : float) -> void:
	pass

func exit() -> void:
	pass

func cooldownEnd() -> void:
	state_machine.transtion_to("Player_Normal", {})
