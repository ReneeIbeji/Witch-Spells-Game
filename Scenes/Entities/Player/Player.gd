class_name Player
extends Entity

func _ready():
	pass
	

func setup() -> void:
	super.setup()
	HealthSystem.EntityDied.connect(playerDead)


func _physics_process(delta : float) -> void:
	var inputDirection : Vector2 = Vector2.ZERO
	if(Input.is_action_pressed("MOVE_up")):
		inputDirection += Vector2.UP
	if(Input.is_action_pressed("MOVE_down")):
		inputDirection += Vector2.DOWN
	if(Input.is_action_pressed("MOVE_left")):
		inputDirection += Vector2.LEFT
	if(Input.is_action_pressed("MOVE_right")):
		inputDirection += Vector2.RIGHT
	
	MovementSystem.moveInDirection(inputDirection)
	MovementSystem.carryOutMovement(delta)
	


func playerDead() -> void:
	Global.PlayerDied()
