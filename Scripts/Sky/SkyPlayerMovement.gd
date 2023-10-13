extends CharacterBody2D

@export var speed = 200
var GRAVITY=15
@onready var _animated_sprite = $AnimatedSprite2D
var move=true
var flySound
var scoreSound
var hitSound

func _ready():
	flySound=get_parent().get_node("FlySound")
	scoreSound=get_parent().get_node("ScoreSound")
	hitSound=get_parent().get_node("HitSound")
	
func get_input():
	var input_direction = Input.get_vector("", "", "", "WaterJump")
	if Input.is_action_just_pressed("WaterJump"):
		flySound.play()
	coll(input_direction)
	
func _process(delta):
	if get_parent().get_node("TurtleToBird").is_playing() || get_parent().get_node("CapyToParrot").is_playing():
		GRAVITY=0
		move=false
	else:
		GRAVITY=15
		await get_tree().create_timer(0.5).timeout
		if get_parent().alive==true && get_parent().score!=10:
			move=true
		
	
func coll(charac):
	if 20>=position.y:
		speed=speed*-1
		GRAVITY*=-1

	if position.y>=250:
		speed=speed*-1
		GRAVITY*=-1
	
	if 15>=position.y:
		position.y=40
	if position.y>=255:
		position.y=245
	velocity=charac*speed
	velocity.y+=GRAVITY
		
func _physics_process(delta):
	if move:
		get_input()
		move_and_slide()
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
		_animated_sprite.play("fly")
	



func _on_area_2d_area_entered(area):
	if area.is_in_group("obstacle"):
		hitSound.play()
		move=false
		get_parent().alive=false
		get_parent().get_node("HUD/DeathMenu").set_visible(true)
		LastScene.lastScene=""
	else:
		await get_tree().create_timer(0.5).timeout
		if get_parent().alive:
			scoreSound.play()
			ScoreController.score_up()
			get_parent().score+=1
