extends KinematicBody2D

const gravity = 300
const move_speed = 150

var acceleration = Vector2(0, gravity)
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	# movement vector
	var move: Vector2 = Vector2()
	
	# fetching input
	move.x = int(Input.is_action_pressed("g_right")) - int(Input.is_action_pressed("g_left"))
	
	# tweak animations
	if abs(move.x) > 0:
		$AnimatedSprite.play("right")
	else:
		$AnimatedSprite.play("default")
	if move.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	# calculate physics
	velocity += acceleration*delta
	velocity.x = move.x*move_speed
	velocity = move_and_slide(velocity, Vector2(0, 1))