extends AnimatedSprite2D

var turtleNode

# Called when the node enters the scene tree for the first time.
func _ready():
	turtleNode = get_parent().get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y = lerp(position.y, turtleNode.position.y, 5*delta)
