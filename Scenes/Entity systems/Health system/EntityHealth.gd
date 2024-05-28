class_name EntityHealth
extends Node

signal EntityDied
signal HealthChanged(newHealth : int)

@export var MAXHEALTH : int
@export var health : int
var entityDead : bool

func getCurrentHealth() -> int:
	return health

func setCurrentHealth(value : int) -> void:
	health = value
	clamp(health, 0, MAXHEALTH)
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
	changeCurrentHealth(attack.HealthChange)
	checkDeath()



func checkDeath() -> void:
	if(health <= 0):
		if(!entityDead):
			entityDead = true
			EntityDied.emit()

