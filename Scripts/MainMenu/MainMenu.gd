extends Node2D

var scene_list = ["res://Scenes/WaterScene.tscn","res://Scenes/Sky/SkyScene.tscn","res://Scenes/Land/LandScene.tscn"]
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_main_menu_music()
	ScoreController.set_score(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_creditos_button_pressed():
	$ButtonPressed.play()
	$MainContainer.set_visible(false)
	$CreditosArea.set_visible(true)


func _on_opciones_button_pressed():
	$ButtonPressed.play()
	$MainContainer.set_visible(false)
	$OpcionesArea.set_visible(true)


func _on_jugar_button_pressed():
	$ButtonPressed.play()
	LastScene.lastScene=""
	await $ButtonPressed.finished
	#get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])
	$CanvasLayer.set_visible(false)
	$MainContainer.set_visible(false)
	$LoreScreen.set_visible(true)
	
	#SceneTransition.change_scene(scene_list[randi() % scene_list.size()])


func _on_jugar_button_mouse_entered():
	$ButtonHover.play()


func _on_opciones_button_mouse_entered():
	$ButtonHover.play()


func _on_creditos_button_mouse_entered():
	$ButtonHover.play()


func _on_atras_button_mouse_entered():
	$ButtonHover.play()


func _on_atras_button_pressed():
	$ButtonPressed.play()
	$CreditosArea.set_visible(false)
	$MainContainer.set_visible(true)

func _on_atras_opciones_button_mouse_entered():
	$ButtonHover.play()


func _on_atras_opciones_button_pressed():
	$ButtonPressed.play()
	$MainContainer.set_visible(true)
	$OpcionesArea.set_visible(false)


func _on_next_button_pressed():
	$ButtonPressed.play()
	$LoreScreen/Lore1.set_visible(false)
	$LoreScreen/Lore2.set_visible(true)
	if $LoreScreen/Lore2.is_visible_in_tree():
		$LoreScreen/NextButton.set_visible(false)
		$LoreScreen/InitButton.set_visible(true)	


func _on_init_button_pressed():
	$ButtonPressed.play()
	SceneTransition.change_scene(scene_list[randi() % scene_list.size()])
