class_name  PotionThrower
extends Node

@export var testPotion : PackedScene
@export var testHealPotion : PackedScene

var currentPotion : int = potion.Hurt
enum potion {Heal, Hurt}


func _ready() -> void:
	var entity : Entity = get_parent() as Entity
	entity.PotionThrowerSystem = self


func throw(direction : Vector2) -> void:
	var thisPotion : Potion
	if currentPotion == potion.Hurt:
		thisPotion = testPotion.instantiate()
	elif currentPotion == potion.Heal:
		thisPotion = testHealPotion.instantiate()
	
	thisPotion.position = get_parent().position
	thisPotion.setDirection(direction)
	GameVariables.WorldNode.add_child(thisPotion)
	currentPotion = randi() % 2
