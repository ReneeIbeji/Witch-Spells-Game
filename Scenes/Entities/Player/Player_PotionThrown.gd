extends State

func enter(values : Dictionary) -> void:
	if GameVariables.PlayerNode.throwablesQueue.queueEmpty():
		cooldownEnd()
		return
	var nextThrowableData = (GameVariables.PlayerNode as Player).throwablesQueue.getNextThrowable()
	GameVariables.PlayerNode.PotionThrowerSystem.throw(nextThrowableData,values["Direction"])
	GameVariables.PlayerNode.knockback(values["Direction"] * -1,5,1)
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
