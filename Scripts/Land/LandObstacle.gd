extends Node2D

var obstacle_speed = 150
var is_stopped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_stopped:
		position.x -= obstacle_speed * delta
		if position.x<5:
			position.x=700
			position.y=250+randi()%25
		
		
func stop():
	is_stopped = true
	


