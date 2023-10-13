extends Node2D
var scene_list = ["res://Scenes/Sky/SkyScene.tscn","res://Scenes/Land/LandScene.tscn"]
var score
var alive
var changeScene = false
@onready var parrotToTurtle = $ParrotToTurtle
@onready var capyToTurtle = $CapyToTurtle
@onready var poof = $PoofAnimation
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_turtle_music()
	MusicController.play_poof_sound()
	poof.play("poofAnimation")
	$Player.canMove = false
	if LastScene.lastScene=="parrot":
		$ParrotToTurtle.set_visible(true)
		parrotToTurtle.play()
	elif LastScene.lastScene=="capy":
		$CapyToTurtle.set_visible(true)
		capyToTurtle.play()
	else:
		$Player.set_visible(true)
		
		
	alive=true
	$TextureRect/AnimationPlayer.play("Algae_Movement_Animation")
	score=0
	LastScene.lastScene="turtle"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(ScoreController.get_score()))
	if score == 8:
		$Player.canMove = false
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])
		#SceneTransition.change_scene(scene_list[randi() % scene_list.size()])
	
	if !$ParrotToTurtle.is_playing() && !$CapyToTurtle.is_playing():
		$ParrotToTurtle.set_visible(false)
		$CapyToTurtle.set_visible(false)
		$Player.set_visible(true)
	
	if !poof.is_playing():
		$PoofAnimation.set_visible(false)
		
func _on_texture_button_pressed():
	$ButtonPressed.play()
	SceneTransition.change_scene("res://Scenes/MainMenu.tscn")

func _on_texture_button_mouse_entered():
	$ButtonHover.play()
