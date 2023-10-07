extends CharacterBody2D

var canMove = false
var dy = 0
var GRAVITY = 35
var MAXFALLSPEED = 50
func _ready():
	$Sprite.play("idle")

func _physics_process(delta):
	if canMove:
		dy += GRAVITY * delta
		if Input.is_action_just_pressed("WaterJump"):
			dy -= 20

		if dy > MAXFALLSPEED:
			dy = 50
		
		position.y -= dy

		if position.y < 0:
			position.y = 0
			dy = 0
		if position.y > 270:
			position.y = 270
			dy = 0


func _process(delta):
	pass
