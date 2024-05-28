extends Enemy

@export var attack : Attack

func _ready():
	if !GameVariables.EnemyNodes.has(self):
		GameVariables.EnemyNodes.append(self)
	speed = 200
	acceleration = 1.5

func _physics_process(delta) -> void:
	MovementSystem.moveInDirection((getPlayerPosition() - position).normalized())
	MovementSystem.carryOutMovement(delta)


func _on_hit_box_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Player):
		(body as Player).HealthSystem.impactHealth(attack)
		if !(body as Player).HealthSystem.entityDead:
			knockback((position - body.position).normalized(),5,1)


