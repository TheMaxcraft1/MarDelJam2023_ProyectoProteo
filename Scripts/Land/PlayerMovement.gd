extends CharacterBody2D

const JUMP_VELOCITY = -450.0
var capibaraJumpSound
var scoreUpSound
var hitSound
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 800
var stopping_gravity = 1500
var canMove

func _ready():
	capibaraJumpSound = get_parent().get_node("CapibaraJump")
	scoreUpSound = get_parent().get_node("ScoreUp")
	hitSound = get_parent().get_node("HitSound")

func _physics_process(delta):
	if canMove:
	# Add the gravity.
	#not is_on_floor()
		if !Input.is_action_pressed("LandJump") and velocity.y < 0:
			velocity.y += stopping_gravity * delta
		else:
			velocity.y += gravity * delta

	# Handle Jump.

		if Input.is_action_just_pressed("LandJump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			capibaraJumpSound.play()

		move_and_slide()


func _process(delta):
	if get_parent().get_node("ParrotToCapy").is_playing() || get_parent().get_node("TurtleToCapy").is_playing():
		canMove=false
	else:
		#await get_tree().create_timer(1).timeout
		if get_parent().alive==true && get_parent().score<10:
			canMove=true
			
	if 30>=position.y:
		position.y=30
		velocity.y += gravity * delta
func _on_area_2d_area_entered(area):
	if area.is_in_group("obstacle"):
		LastScene.lastScene=""
		hitSound.play()
		get_tree().call_group("LandParallaxAnims", "stop")
		var obstaculos = get_tree().get_nodes_in_group("obstacle")
		for i in range(obstaculos.size()):
			obstaculos[i].get_parent().stop()
		get_parent().alive=false
		canMove=false
		get_parent().get_node("HUD/DeathMenu").set_visible(true)
	elif area.get_name() == "ScoreArea":
		scoreUpSound.play()
		get_parent().score+=1
		ScoreController.score_up()

