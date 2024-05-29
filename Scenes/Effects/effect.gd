extends Node2D

@export var floatspeed : float
@export_range(0, 10, 1, "or_greater", "or_less") var appeartime : float

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().create_timer(appeartime).timeout.connect(endEffect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= floatspeed * delta

func endEffect():
	queue_free()
