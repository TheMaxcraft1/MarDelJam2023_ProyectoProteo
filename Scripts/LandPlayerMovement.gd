extends CharacterBody2D

@export var jump_speed : float
@export var gravity : float
@onready var animatedSprite:AnimatedSprite2D = $AnimatedSprite2D

var canJump = false
var speed_y = 0

func _ready():
	animatedSprite.play("jump")

func _physics_process(delta):
	
	speed_y += gravity * delta
	
	if is_on_floor():
		canJump = true
		speed_y = 0
	
	if canJump:	
		if Input.is_action_just_pressed("LandJump"):
			speed_y = -jump_speed
			print('apretado')
			canJump = false
	
	velocity = Vector2(0, speed_y)
	move_and_slide()
		
	

func _process(delta):
	pass
