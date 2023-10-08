extends Node2D
var scene_list = ["res://Scenes/WaterScene.tscn","res://Scenes/Land/LandScene.tscn"]

@onready var _animated_sprite = $DronAnimation
var score
var alive
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_parrot_music()
	_animated_sprite.play("dronAnimation")
	score=0
	alive=true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(ScoreController.get_score()))
	if score == 5:
		get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])



func _on_texture_button_pressed():
	$ButtonPressed.play()
	SceneTransition.change_scene("res://Scenes/MainMenu.tscn")

func _on_texture_button_mouse_entered():
	$ButtonHover.play()
