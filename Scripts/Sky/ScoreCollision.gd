extends Sprite2D


func _physics_process(delta):
	position.x -= 120 * delta
	if position.x < -1500:
		free()
