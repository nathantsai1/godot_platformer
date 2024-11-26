extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -500.0
var loads2 = load("res://scenes/scene2.tscn")

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
# animated sprite is the animated sprite
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if velocity.x > 1 or velocity.x < -1:
		animated_sprite_2d.animation = "default"
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jumping"
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		animated_sprite_2d.animation = "running"
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var isLeft = velocity.x < 0;
	animated_sprite_2d.flip_h = isLeft

func _on_e_body_entered(body: Node2D) -> void:
	print('1')
	get_tree().change_scene_to_packed(loads2)
