class_name Enemy
extends Entity

var startPosition : Vector2

func getPlayerPosition() -> Vector2:
	return GameVariables.PlayerNode.position;

func setup() -> void:
	super.setup()
	startPosition = position
	HealthSystem.EntityDied.connect(killed)

func reset() -> void:
	super.reset()
	show()
	position = startPosition
	print(position)

func killed() -> void:
	hide()
