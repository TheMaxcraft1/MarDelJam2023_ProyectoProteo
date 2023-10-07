extends Node2D

var scene_list = ["res://Scenes/WaterScene.tscn"]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_creditos_button_pressed():
	$ButtonPressed.play()
	$MainContainer.set_visible(false)
	$CreditosContainer.set_visible(true)


func _on_opciones_button_pressed():
	$ButtonPressed.play()
	$MainContainer.set_visible(false)
	#$OpcionesContainer.set_visible(true)


func _on_jugar_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	get_tree().change_scene_to_file(scene_list[randi() % scene_list.size()])


func _on_jugar_button_mouse_entered():
	$ButtonHover.play()


func _on_opciones_button_mouse_entered():
	$ButtonHover.play()


func _on_creditos_button_mouse_entered():
	$ButtonHover.play()
