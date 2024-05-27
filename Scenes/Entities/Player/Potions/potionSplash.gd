class_name PotionSplash
extends Node
var ended : bool = false
var startScale : float = 0.5
var expansionRate : float =  1.3
var shrinkRate : float = 1.8
var maxScale : float = 2
var countdown : SceneTreeTimer

@onready var sprite : AnimatedSprite2D = get_node("SplashSprite")

func resetScale() -> void:
	setSplashScale(startScale)

func expand(delta : float) -> void:
	setSplashScale(getSplashScale() + getSplashScale() * expansionRate * delta)
	setSplashScale(clamp(getSplashScale(), startScale, maxScale))

func shrink(delta : float) -> void:
	setSplashScale((getSplashScale() - shrinkRate * getSplashScale() * delta))
	setSplashScale(clamp(getSplashScale(), startScale, maxScale))


func ScaleMax() -> bool:
	return getSplashScale() == maxScale

func ScaleMin() -> bool:
	return getSplashScale() == startScale

func endSplash() -> void:
	print("Splash over")
	ended = true

func destory() -> void:
	queue_free()

func setSplashScale(size : float) -> void:
	self.scale = Vector2(size, size)

func getSplashScale() -> float:
	return self.scale.x
