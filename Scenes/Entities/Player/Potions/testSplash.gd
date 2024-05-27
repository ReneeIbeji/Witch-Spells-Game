extends PotionSplash

@export var attack : Attack

var inArea : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	resetScale()
	countdown = get_tree().create_timer(3)
	countdown.timeout.connect(endSplash)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(!ScaleMax() and !ended):
		expand(delta)
	
	if(ended):
		shrink(delta)
		if ScaleMin():
			destory()
	

func _process(delta : float) -> void:
	for timerset in inArea:
		timerset = timerset as enemyTimer
		timerset.countdown -= delta
		if(timerset.countdown <= 0):
			hitEntity(timerset.entity)
			timerset.countdown = 2

func hitEntity(entity : Entity) -> void:
	entity.HealthSystem.impactHealth(attack)

func _on_splash_collision_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Entity):
		var entity : Entity = body as Entity
		hitEntity(entity)
		addEntityToZone(entity)


func _on_splash_collision_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if(body is Entity):
		var entity : Entity = body as Entity
		removeEntityFromZone(entity)



func addEntityToZone(entity : Entity) -> void:
	var timerSet = enemyTimer.new()
	timerSet.countdown = 2
	timerSet.entity = entity
	inArea.push_back(timerSet)
	

func removeEntityFromZone(entity : Entity):
	for i in range(inArea.size()):
		if (inArea[i] as enemyTimer).entity == entity:
			inArea.remove_at(i)
			return

class enemyTimer:
	var countdown : float
	var entity : Entity
