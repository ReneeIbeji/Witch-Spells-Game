class_name GameWorld
extends Node2D


var currentLevel : LevelData
var playerScene : PackedScene = preload("res://Scenes/Entities/Player/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameVariables.WorldNode = self



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func LoadLevel(levelData : LevelData) -> void:
	currentLevel = levelData
	for child in get_children():
		child.queue_free()
	
	var newPlayerScene : Player = playerScene.instantiate() as Player
	newPlayerScene.position = levelData.startPoint
	add_child(newPlayerScene)
	GameVariables.PlayerNode = newPlayerScene
	var newLevel : Level = levelData.LevelScene.instantiate() as Level
	add_child(newLevel)
	GameVariables.LevelNode = newLevel
	GameVariables.EnemyNodes.clear()
	
	newLevel.setUpLevel()
	newPlayerScene.setup()
	GameVariables.gameOverlayNode.connectUIToGame()



func ReloadLevel() -> void:
	for child in get_children():
		child.queue_free()
	
	var newPlayerScene : Player = playerScene.instantiate() as Player
	newPlayerScene.position = currentLevel.startPoint
	add_child(newPlayerScene)
	GameVariables.PlayerNode = newPlayerScene
	var newLevel : Level = currentLevel.LevelScene.instantiate() as Level
	add_child(newLevel)
	GameVariables.LevelNode = newLevel
	GameVariables.EnemyNodes.clear()
	
	newLevel.setUpLevel()
	newPlayerScene.setup()
	GameVariables.gameOverlayNode.connectUIToGame()
	
	#for child in get_children():
	#	if((child is Potion) or (child is PotionSplash)):
	#		child.queue_free()
	#	else:
	#		child.reset()
	#GameVariables.PlayerNode.position = currentLevel.startPoint
	#GameVariables.PlayerNode.reset()


