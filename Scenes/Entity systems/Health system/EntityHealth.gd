class_name EntityHealth
extends Node

signal EntityDied
signal EntityHeal
signal EntityHurt

signal HealthChanged(newHealth : int)

@export var MAXHEALTH : int
@export var health : int
var entityDead : bool

func getCurrentHealth() -> int:
	return health

func setCurrentHealth(value : int) -> void:
	health = value
	health = clamp(health, 0, MAXHEALTH)
	HealthChanged.emit(health)

func changeCurrentHealth(value : int) -> void:
	setCurrentHealth(getCurrentHealth() + value)

func _ready():
	var entity : Entity = get_parent() as Entity
	entity.HealthSystem = self

func setup() -> void:
	setCurrentHealth(MAXHEALTH)
	entityDead = false

func impactHealth(attack : Attack) -> void:
	if(entityDead): return
	
	if(attack.HealthChange > 0):
		emit_signal("EntityHeal")
	elif (attack.HealthChange < 0):
		emit_signal("EntityHurt")
	
	changeCurrentHealth(attack.HealthChange)
	checkDeath()



func checkDeath() -> void:
	if(health <= 0):
		if(!entityDead):
			entityDead = true
			EntityDied.emit()

