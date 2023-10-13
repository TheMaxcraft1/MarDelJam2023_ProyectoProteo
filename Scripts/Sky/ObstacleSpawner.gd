extends Node2D

var Obstacle=preload("res://Scenes/Sky/SkyObstacles.tscn")

var spawn = false


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	spawn = true
		


func _on_timer_timeout():
	if spawn:
		var obstacle = Obstacle.instantiate()
		obstacle.position.x=400
		obstacle.position.y=10+randi()%250
		if obstacle.position.y<50:
			obstacle.position.y=80
		if obstacle.position.y>220:
			obstacle.position.y=199
		add_child(obstacle)
		
