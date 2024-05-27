class_name  PotionThrower
extends Node

@export var testPotion : PackedScene

func _ready() -> void:
	var entity : Entity = get_parent() as Entity
	entity.PotionThrowerSystem = self
	print("Potion thrower ready")

func throw(direction : Vector2) -> void:
	var thisPotion = testPotion.instantiate()
	thisPotion.position = get_parent().position
	thisPotion.setDirection(direction)
	GameVariables.WorldNode.add_child(thisPotion)
