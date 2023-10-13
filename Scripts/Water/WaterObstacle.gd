extends Sprite2D


func _physics_process(delta):
	position.x -= 170 * delta
	if global_position.x < -50:
		queue_free()
