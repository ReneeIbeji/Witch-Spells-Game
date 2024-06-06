extends Control

var DisplayedPlayerHealth : int

# Called when the node enters the scene tree for the first time.
func _ready():
	GameVariables.gameOverlayNode = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(!GameVariables.PlayerNode.throwablesQueue.queueEmpty()):
		var potionName : String = GameVariables.PlayerNode.throwablesQueue.previewNextThrowable().throwableName
		$PotionLabel.text = "Next potion: " + potionName
	else:
		$PotionLabel.text = "Next potion: None"
	
	$ScoreLabel.text = "Score: " + str(GameVariables.score)

func connectUIToGame() -> void:
	GameVariables.PlayerNode.HealthSystem.HealthChanged.connect(updatePlayerHealth)
	updatePlayerHealth(GameVariables.PlayerNode.HealthSystem.getCurrentHealth())

func updatePlayerHealth(newPlayerHealth : int):
	$HealthLabel.text = str(newPlayerHealth)
	DisplayedPlayerHealth = newPlayerHealth
