extends Node2D

var canSpawn = false
@export var obstacleScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	canSpawn = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if canSpawn:
		var newObstacle = obstacleScene.instantiate()
		newObstacle.position.y = randi_range(-25,60)
		add_child(newObstacle)
		
