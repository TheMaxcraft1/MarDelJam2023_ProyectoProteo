extends Node2D

@export var x_speed : float


func _physics_process(delta):
	position.x -= 50 * delta
	if global_position.x < -50:
		queue_free()


func _on_score_area_entered(area):
	print('puntone')
