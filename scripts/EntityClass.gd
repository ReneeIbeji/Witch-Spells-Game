class_name Entity
extends CharacterBody2D

var isStatic : bool = false

var speed : float = 600
var acceleration : float =  2.5
var friction : float = 0.4

var HealthSystem : EntityHealth
var MovementSystem : EntityMovement
var PotionThrowerSystem : PotionThrower

func setup() -> void:
	if(HealthSystem):
		HealthSystem.setup()
		

func reset() -> void:
	if(HealthSystem != null):
		HealthSystem.setup()
	
	if(MovementSystem):
		MovementSystem.reset()

func knockback(direction : Vector2, force : float, delta : float) -> void:
	MovementSystem.applyKnockback(direction, force)
	MovementSystem.carryOutMovement(delta)
