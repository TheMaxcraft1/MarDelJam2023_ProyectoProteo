extends AnimatedSprite2D

var parrotNode

# Called when the node enters the scene tree for the first time.
func _ready():
	parrotNode = get_parent().get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = lerp(position.y, parrotNode.position.y, 5*delta)
	if position.y>=195:
		position.y=195
