extends Node2D


func loadScene():
	pass

func pauseGame():
	pass

func PlayerDied():
	GameVariables.WorldNode.ReloadLevel()
