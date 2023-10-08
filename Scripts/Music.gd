extends Node

var turtleMusic = load("res://Music/TurtleMusic.mp3")
var capibaraMusic = load("res://Music/CapibaraMusic.wav")
var parrotMusic = load("res://Music/ParrotMusic.wav")
var mainMenuMusic = load("res://Music/MainMenuMusic.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func play_main_menu_music():
	$Music.stream = mainMenuMusic
	$Music.play()
	
func play_capibara_music():
	$Music.stream = capibaraMusic
	$Music.play()
	
func play_parrot_music():
	$Music.stream = parrotMusic
	$Music.play()

func play_turtle_music():
	$Music.stream = turtleMusic
	$Music.play()

func _on_music_finished():
	$Music.play
