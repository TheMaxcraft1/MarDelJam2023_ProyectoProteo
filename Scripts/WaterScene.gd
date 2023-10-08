extends Node2D
var scene_list = ["res://Scenes/Sky/SkyScene.tscn","res://Scenes/Land/LandScene.tscn"]
var score
var alive
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_turtle_music()
	await get_tree().create_timer(1).timeout
	$Player.canMove = true
	alive=true
	$TextureRect/AnimationPlayer.play("Algae_Movement_Animation")
	score=0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(ScoreController.get_score()))
	await get_tree().create_timer(2).timeout
	if alive:
		if score == 3:
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])
		
func _on_texture_button_pressed():
	$ButtonPressed.play()
	SceneTransition.change_scene("res://Scenes/MainMenu.tscn")

func _on_texture_button_mouse_entered():
	$ButtonHover.play()
