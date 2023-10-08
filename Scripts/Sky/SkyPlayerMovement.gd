extends CharacterBody2D

@export var speed = 200
var GRAVITY=15
@onready var _animated_sprite = $AnimatedSprite2D
var move=true

func get_input():
	var input_direction = Input.get_vector("", "", "", "WaterJump")
	coll(input_direction)
	

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
	print("POSICION Y: ",position.y)
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
		move=false
	else:
		get_parent().score+=1
