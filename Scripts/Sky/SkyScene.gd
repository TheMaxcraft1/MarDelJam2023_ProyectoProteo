extends Node2D

@onready var _animated_sprite = $DronAnimation
var score
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_parrot_music()
	_animated_sprite.play("dronAnimation")
	score=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(score))
