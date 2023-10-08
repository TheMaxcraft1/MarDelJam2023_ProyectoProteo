extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_turtle_music()
	await get_tree().create_timer(1).timeout
	$Player.canMove = true
	$TextureRect/AnimationPlayer.play("Algae_Movement_Animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(ScoreController.get_score()))


