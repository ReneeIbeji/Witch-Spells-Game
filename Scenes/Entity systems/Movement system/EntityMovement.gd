class_name EntityMovement
extends Node2D


var targetMovement : Vector2
var movementDirection : Vector2

@onready var body : Entity = get_parent() as Entity

func _ready() -> void:
	var entity : Entity = get_parent() as Entity
	entity.MovementSystem = self

func reset() -> void:
	movementDirection = Vector2.ZERO
	targetMovement = Vector2.ZERO
	body.velocity = Vector2.ZERO

func moveInDirection(movement : Vector2) -> void:
	targetMovement = movement

func carryOutMovement(delta : float) -> void:
	movementDirection.x = move_toward(movementDirection.x, targetMovement.x, delta * body.acceleration)
	movementDirection.y = move_toward(movementDirection.y, targetMovement.y, delta * body.acceleration)
	
	body.velocity = movementDirection * body.speed
	body.velocity -= body.velocity * body.friction
	
	body.move_and_slide()

func applyKnockback(direction : Vector2, force : float) -> void:
	movementDirection += direction * force
