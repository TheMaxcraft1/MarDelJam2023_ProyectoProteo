extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	position.x -= 120 * delta
	if position.x < -2000:
		free()

