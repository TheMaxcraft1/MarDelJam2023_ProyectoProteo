extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	$Sound.play()
	await get_tree().create_timer(1).timeout
	SceneTransition.change_scene("res://Scenes/MainMenu.tscn")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
