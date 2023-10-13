extends Node2D
var scene_list = ["res://Scenes/WaterScene.tscn","res://Scenes/Sky/SkyScene.tscn"]
var MAX_SCORE = 10
var score_to_change = ScoreController.get_score() + MAX_SCORE
var alive
@onready var _animated_sprite = $DronAnimation
@onready var transition = $Transition
@onready var poof = $PoofAnimation
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_capibara_music()
	MusicController.play_poof_sound()
	_animated_sprite.play("dronAnimation")
	poof.play("poofAnimation")
	$Player.canMove = false
	if LastScene.lastScene=="parrot":
		$Transition.set_visible(true)
		transition.play("parrotToCapy")
	elif LastScene.lastScene=="turtle":
		$Transition.set_visible(true)
		transition.play("turtleToCapy")
	else:
		$Transition.set_visible(false)
		$Player.set_visible(true)
		
	
	alive=true
	LastScene.lastScene="capy"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(ScoreController.get_score()))
	if ScoreController.get_score() == score_to_change:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])
	
	if !$Transition.is_playing():
		$Transition.set_visible(false)
		$Player.set_visible(true)
	if !poof.is_playing():
		$PoofAnimation.set_visible(false)
		
func _on_texture_button_pressed():
	$ButtonPressed.play()
	SceneTransition.change_scene("res://Scenes/MainMenu.tscn")


func _on_texture_button_mouse_entered():
	$ButtonHover.play()
