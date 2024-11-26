extends RigidBody2D

export var min_speed = 150.0
export var max_speed = 250.0

func _ready():
	$AnimatedSprite2D.playing = true
	var mob_types = $AnimatedSprite2D.frames.get_animation_names()
	$AnimatedSprite2D.animation = mob_types[randi() % mob_types.size]	
