class_name Level
extends Node2D

func setUpLevel() -> void:
	for child in get_children():
		if child is Enemy:
			GameVariables.EnemyNodes.push_back(child)
		if child is Entity:
			child.setup()

func reset() -> void:
	for child in get_children():
		if child is Entity:
			child.reset()
