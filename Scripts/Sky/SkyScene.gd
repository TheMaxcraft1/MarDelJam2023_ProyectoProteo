extends Node2D
var scene_list = ["res://Scenes/WaterScene.tscn","res://Scenes/Land/LandScene.tscn"]

@onready var _animated_sprite = $DronAnimation
@onready var turtleToParrot = $TurtleToBird
@onready var capyToParrot = $CapyToParrot
@onready var poof = $PoofAnimation
var score
var alive
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_parrot_music()
	_animated_sprite.play("dronAnimation")
	poof.play("poofAnimation")
	MusicController.play_poof_sound()
	#await get_tree().create_timer(0.5).timeout
	if LastScene.lastScene=="turtle":
		$TurtleToBird.set_visible(true)
		turtleToParrot.play()
	elif LastScene.lastScene=="capy":
		$CapyToParrot.set_visible(true)
		capyToParrot.play()
	else:
		$Player.set_visible(true)
	score=0
	alive=true
	LastScene.lastScene="parrot"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$HUD/ScoreLabel.set_text("PUNTAJE: " +  str(ScoreController.get_score()))
	if score == 10 && alive:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])
	if !$TurtleToBird.is_playing() && !$CapyToParrot.is_playing():
		$TurtleToBird.set_visible(false)
		$CapyToParrot.set_visible(false)
		$Player.set_visible(true)
		
	if !poof.is_playing():
		$PoofAnimation.set_visible(false)



func _on_texture_button_pressed():
	$ButtonPressed.play()
	SceneTransition.change_scene("res://Scenes/MainMenu.tscn")

func _on_texture_button_mouse_entered():
	$ButtonHover.play()
