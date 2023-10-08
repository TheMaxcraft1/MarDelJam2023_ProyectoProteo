extends CharacterBody2D

@export var jump_speed : float
@export var gravity : float
@onready var animatedSprite:AnimatedSprite2D = $AnimatedSprite2D

var canInteract = true
var canJump = false
var speed_y = 0
var capibaraJump
var hitSound
var scoreUpSound

func _ready():
	animatedSprite.play("jump")
	hitSound = get_parent().get_node("HitSound")
	capibaraJump = get_parent().get_node("CapibaraJump")
	scoreUpSound = get_parent().get_node("ScoreUp")

func _physics_process(delta):
	
	speed_y += gravity * delta
	
	if canInteract:
		if is_on_floor():
			canJump = true
			speed_y = 0
	
	if canInteract:
		if canJump:	
			if Input.is_action_just_pressed("LandJump"):
				capibaraJump.play()
				speed_y = -jump_speed
				print('apretado')
				canJump = false
	
	velocity = Vector2(0, speed_y)
	move_and_slide()
		
	

func _process(delta):
	pass
	
func _on_area_2d_area_entered(area):
#	print(area)
	if area.name == "Score":
		ScoreController.score_up()
		scoreUpSound.play()
		print('puntone')
		
	if area.name == ("DeathArea"):
		hitSound.play()
		print("dead")
		canInteract = false
		get_parent().get_node("HUD/DeathMenu").set_visible(true)

