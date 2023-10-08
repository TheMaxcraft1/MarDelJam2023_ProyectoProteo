extends AnimatedSprite2D


var capibaraNode

# Called when the node enters the scene tree for the first time.
func _ready():
	capibaraNode = get_parent().get_node("PlayerCarpincho")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y = lerp(position.y, capibaraNode.position.y + 135, 5*delta)
