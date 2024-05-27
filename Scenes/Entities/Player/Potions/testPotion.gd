extends Potion



func _ready() -> void:
	startPoint = position
	speed = 300

func setDirection(direction : Vector2) -> void:
	targetPoint = position + direction * 200


func _physics_process(delta) -> void:
	if !checkReachTarget():
		moveTowardsTarget(delta)
	else:
		explode()
		queue_free()


