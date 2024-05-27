extends Node

@export var testLevel : LevelData




# Called when the node enters the scene tree for the first time.
func _ready():
	GameVariables.GamePaused = false
	GameVariables.InCutscene = false
	#Temp until creating main menu
	playLevel(testLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playLevel(levelData : LevelData):
	print(levelData.startPoint)
	GameVariables.WorldNode.LoadLevel(levelData)


