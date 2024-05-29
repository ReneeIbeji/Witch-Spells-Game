class_name Entity
extends CharacterBody2D

var isStatic : bool = false

var speed : float = 600
var acceleration : float =  2.5
var friction : float = 0.4

var HealthSystem : EntityHealth
var MovementSystem : EntityMovement
var PotionThrowerSystem : PotionThrower

var hurtEffect : PackedScene = preload("res://Scenes/Effects/hurtEffect.tscn")
var healEffect : PackedScene = preload("res://Scenes/Effects/healEffect.tscn")

func setup() -> void:
	if(HealthSystem):
		HealthSystem.setup()
		HealthSystem.EntityHurt.connect(entityHurt)
		HealthSystem.EntityHeal.connect(entityHeal)
		

func reset() -> void:
	if(HealthSystem != null):
		HealthSystem.setup()
	
	if(MovementSystem):
		MovementSystem.reset()

func entityHurt() -> void:
	var effect : Node2D = hurtEffect.instantiate()
	effect.position = position
	get_parent().add_child(effect)

func entityHeal() -> void:
	var effect : Node2D = healEffect.instantiate()
	effect.position = position
	get_parent().add_child(effect)

func knockback(direction : Vector2, force : float, delta : float) -> void:
	MovementSystem.applyKnockback(direction, force)
	MovementSystem.carryOutMovement(delta)
