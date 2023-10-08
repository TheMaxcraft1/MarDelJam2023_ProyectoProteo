extends CharacterBody2D

var turtleSwimSound
var scoreUpSound
var hitSound
var canMove = false
var dy = 0
var GRAVITY = 25
var MAXFALLSPEED = 45
func _ready():
	$Sprite.play("idle")
	turtleSwimSound = get_parent().get_node("TurtleSwim")
	scoreUpSound = get_parent().get_node("ScoreUp")
	hitSound = get_parent().get_node("Hit")

func _physics_process(delta):
	if canMove:
		dy += GRAVITY * delta
		if Input.is_action_just_pressed("WaterJump"):
			turtleSwimSound.play()
			dy -= 15
		

		if dy > MAXFALLSPEED:
			dy = MAXFALLSPEED
		
		position.y -= dy

		if position.y < 0:
			position.y = 0
			canMove = false
			hitSound.play()
		if position.y > 270:
			position.y = 270
			dy = 0


func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == "WallArea":
		canMove = false
		get_parent().alive=false
		hitSound.play()
		get_parent().get_node("HUD/DeathMenu").set_visible(true)
		get_parent().get_node("ObstacleSpawner").canSpawn = false
	if area.name == "ScoreArea":
		await get_tree().create_timer(0.2).timeout
		if canMove:
			scoreUpSound.play()
			ScoreController.score_up()
			get_parent().score+=1
