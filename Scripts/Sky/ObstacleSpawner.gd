extends Node2D

var Obstacle=preload("res://Scenes/Sky/SkyObstacles.tscn")

var spawn = false


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	spawn = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if spawn:
		var obstacle = Obstacle.instantiate()
		obstacle.position.x=450
		obstacle.position.y=10+randi()%250
		add_child(obstacle)
		
