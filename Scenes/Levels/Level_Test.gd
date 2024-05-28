extends Level

@export var enemyPackedScene : PackedScene
func _ready() -> void:
	var countdown = get_tree().create_timer(7)
	countdown.timeout.connect(spawnNewEnemy)



func spawnNewEnemy() -> void:
	for i in range(randi() % 5):
		var newEnemy : Enemy = enemyPackedScene.instantiate() as Enemy
		add_child(newEnemy)
		print(newEnemy.get_class())
		newEnemy.position = Vector2(randi() % 1920,randi() % 1080)
		newEnemy.setup()
	
	var countdown = get_tree().create_timer(7)
	countdown.timeout.connect(spawnNewEnemy)
