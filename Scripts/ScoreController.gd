extends Node

var score : int

func _ready():
	score = 0

func score_up():
	score += 1
	
func get_score():
	return score
	
func set_score(newScore):
	score = newScore
