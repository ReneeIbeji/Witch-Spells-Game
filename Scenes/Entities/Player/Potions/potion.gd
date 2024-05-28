class_name Potion
extends Throwable

@export var splashScene : PackedScene
var splash : PotionSplash
@onready var sprite : PotionSprite = get_node("PotionSprite")


func explode() -> void:
	splash = splashScene.instantiate()
	print("Splash start!")
	splash.position = position
	get_parent().add_child(splash)
