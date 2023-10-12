extends Node2D
var scene_list = ["res://Scenes/WaterScene.tscn","res://Scenes/Sky/SkyScene.tscn"]
var MAX_SCORE = 10
var score_to_change = ScoreController.get_score() + MAX_SCORE

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_capibara_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(ScoreController.get_score()))
	if ScoreController.get_score() == score_to_change:
		get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])


func _on_texture_button_pressed():
	$ButtonPressed.play()
	SceneTransition.change_scene("res://Scenes/MainMenu.tscn")


func _on_texture_button_mouse_entered():
	$ButtonHover.play()
