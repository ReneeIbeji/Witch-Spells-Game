class_name ThrowablesQueue
extends Node2D

@export var addPotionCooldown : float
@export var possibleThrowables : Array[throwableData]
var queue : Array[throwableData]
var timeLeft : float
var timerRunning : bool

func startPotionQueueing() -> void:
	timerRunning = true

func stopPotionQueueing() -> void:
	timerRunning = false

func _ready():
	(get_parent() as Player).thowablesQueue = self
	timerRunning = false
	timeLeft = addPotionCooldown

func _process(delta) -> void:
	if(timerRunning):
		timeLeft -= delta
		if(timeLeft <= 0):
			addNewPotionToQueue() 

func addNewPotionToQueue() -> void:
	queue.push_back(possibleThrowables[randi() % possibleThrowables.size()])
	print("added new spell: " + queue.back().throwableName)
	timeLeft = addPotionCooldown

func takePotionFromQueue() -> throwableData:
	return queue.pop_front()

