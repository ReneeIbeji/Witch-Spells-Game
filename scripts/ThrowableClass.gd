class_name Throwable
extends Node2D

var targetPoint : Vector2
var startPoint : Vector2
var speed : float


func moveTowardsTarget(delta: float) -> void:
	position = position.move_toward(targetPoint, delta * speed)

func checkReachTarget() -> bool:
	return targetPoint == position
