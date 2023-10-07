extends CharacterBody2D

var canMove = false
var dy = 0
var GRAVITY = 25
var MAXFALLSPEED = 45
func _ready():
	$Sprite.play("idle")

func _physics_process(delta):
	if canMove:
		dy += GRAVITY * delta
		if Input.is_action_just_pressed("WaterJump"):
			dy -= 15
		

		if dy > MAXFALLSPEED:
			dy = MAXFALLSPEED
		
		position.y -= dy

		if position.y < 0:
			position.y = 0
			dy = 0
		if position.y > 270:
			position.y = 270
			dy = 0


func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == "WallArea":
		canMove = false
	if area.name == "ScoreArea":
		get_parent().score += 1
