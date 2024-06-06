class_name ThrowablesQueue
extends Node2D

@export var addPotionCooldown : float
@export var possibleThrowables : Array[throwableData]
var queue : Array[throwableData]
var timeLeft : float
var timerRunning : bool

func startThrowableQueuing() -> void:
	timerRunning = true

func stopThrowableQueuing() -> void:
	timerRunning = false

func _ready():
	(get_parent() as Player).throwablesQueue = self
	timerRunning = false
	timeLeft = addPotionCooldown

func _process(delta) -> void:
	if(timerRunning):
		timeLeft -= delta
		if(timeLeft <= 0):
			addNewThrowableToQueue() 

func addNewThrowableToQueue() -> void:
	queue.push_back(possibleThrowables[randi() % possibleThrowables.size()])
	print("added new spell: " + queue.back().throwableName)
	timeLeft = addPotionCooldown

func getNextThrowable() -> throwableData:
	return queue.pop_front()

func previewNextThrowable() -> throwableData:
	return queue.front()

func queueEmpty() -> bool:
	return queue.is_empty()

