extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	GameVariables.GamePaused = false
	GameVariables.InCutscene = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
