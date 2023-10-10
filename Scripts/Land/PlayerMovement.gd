extends CharacterBody2D

const JUMP_VELOCITY = -450.0
var capibaraJumpSound
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 800

func _ready():
	capibaraJumpSound = get_parent().get_node("CapibaraJump")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("LandJump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		capibaraJumpSound.play()

	move_and_slide()
