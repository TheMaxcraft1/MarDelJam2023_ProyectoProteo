extends CharacterBody2D

const JUMP_VELOCITY = -450.0
var capibaraJumpSound
var scoreUpSound
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 800

func _ready():
	capibaraJumpSound = get_parent().get_node("CapibaraJump")
	scoreUpSound = get_parent().get_node("ScoreUp")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("LandJump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		capibaraJumpSound.play()

	move_and_slide()



func _on_area_2d_area_entered(area):
	if area.is_in_group("obstacle"):
		get_parent().get_node("HUD/DeathMenu").set_visible(true)
	elif area.get_name() == "ScoreArea":
		scoreUpSound.play()
		ScoreController.score_up()

