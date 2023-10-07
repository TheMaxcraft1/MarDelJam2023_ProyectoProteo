extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_creditos_button_pressed():
	$MainContainer.set_visible(false)
	$CreditosContainer.set_visible(true)
