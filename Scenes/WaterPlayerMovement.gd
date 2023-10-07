extends Sprite2D


var dy = 0
var GRAVITY = 45
func _ready():
	pass

func _process(delta):
	dy += GRAVITY * delta
	if Input.is_action_just_pressed("WaterJump"):
		dy -= 25

	position.y -= dy

	if position.y < 0:
		position.y = 0
		dy = 0
	if position.y > 270:
		position.y = 270
		dy = 0
