extends Node2D

#var score = ScoreController.get_score()
# Called when the node enters the scene tree for the first time.
func _ready():
	# MusicController.play_capibara_music()
	await get_tree().create_timer(1).timeout
	$PlayerCarpincho.canJump = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/ScoreLabel.set_text("Puntaje: " + str(ScoreController.get_score()))
	
