class_name Potion
extends Node2D

var targetPoint : Vector2
var startPoint : Vector2
var speed : float
@export var splashScene : PackedScene
var splash : PotionSplash
@onready var sprite : PotionSprite = get_node("PotionSprite")

func moveTowardsTarget(delta: float) -> void:
	position = position.move_toward(targetPoint, delta * speed)

func checkReachTarget() -> bool:
	return targetPoint == position

func explode() -> void:
	splash = splashScene.instantiate()
	print("Splash start!")
	splash.position = position
	get_parent().add_child(splash)
