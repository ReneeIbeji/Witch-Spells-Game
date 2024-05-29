extends Control

var DisplayedPlayerHealth : int

# Called when the node enters the scene tree for the first time.
func _ready():
	GameVariables.gameOverlayNode = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var currentPotion : int = GameVariables.PlayerNode.PotionThrowerSystem.currentPotion
	if currentPotion == 0:
		$PotionLabel.text = "Next Potion: Heal"
	else:
		$PotionLabel.text = "Next Potion: Hurt"
	
	$ScoreLabel.text = "Score: " + str(GameVariables.score)

func connectUIToGame() -> void:
	GameVariables.PlayerNode.HealthSystem.HealthChanged.connect(updatePlayerHealth)
	updatePlayerHealth(GameVariables.PlayerNode.HealthSystem.getCurrentHealth())

func updatePlayerHealth(newPlayerHealth : int):
	$HealthLabel.text = str(newPlayerHealth)
	DisplayedPlayerHealth = newPlayerHealth
