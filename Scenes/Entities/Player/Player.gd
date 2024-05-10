class_name Player
extends Entity

var Movement : EntityMovement

# Called when the node enters the scene tree for the first time.
func _ready():
	GameVariables.PlayerNode = self
	
	for child in self.get_children():
		if child is EntityMovement:
			Movement = child

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var inputDirection : Vector2 = Vector2.ZERO
	if(Input.is_action_pressed("MOVE_up")):
		inputDirection += Vector2.UP
	if(Input.is_action_pressed("MOVE_down")):
		inputDirection += Vector2.DOWN
	if(Input.is_action_pressed("MOVE_left")):
		inputDirection += Vector2.LEFT
	if(Input.is_action_pressed("MOVE_right")):
		inputDirection += Vector2.RIGHT
	
	Movement.moveInDirection(inputDirection)
	Movement.carryOutMovement(delta)
	
	
