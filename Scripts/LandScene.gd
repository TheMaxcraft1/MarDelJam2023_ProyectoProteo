extends Node2D

var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	$PlayerCarpincho.canJump = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
