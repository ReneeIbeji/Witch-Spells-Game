class_name  PotionThrower
extends Node

@export var testPotion : PackedScene
@export var testHealPotion : PackedScene


var currentPotion : int = potion.Hurt
enum potion {Heal, Hurt}


func _ready() -> void:
	var entity : Entity = get_parent() as Entity
	entity.PotionThrowerSystem = self


func throw(throwable : throwableData, direction : Vector2) -> void:
	var thisPotion : Throwable = throwable.throwableScene.instantiate()
	
	thisPotion.position = get_parent().position
	thisPotion.setDirection(direction)
	GameVariables.WorldNode.add_child(thisPotion)
	currentPotion = randi() % 2
