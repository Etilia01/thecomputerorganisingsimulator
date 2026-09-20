extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0
@onready var sprite = $Sprite2D

var right = preload("res://right.png")
var left = preload("res://left.png")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if direction<0:
			sprite.texture = left
		else:
			sprite.texture= right
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
