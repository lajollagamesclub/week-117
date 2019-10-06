extends KinematicBody2D

const gravity = 700
var move_speed = 50
const jump_speed = 200

var acceleration = Vector2(0, gravity)
var velocity = Vector2()

var move: Vector2 = Vector2(1, 0)

func _ready():
	randomize()
	var speed_multiplier = rand_range(0, 1)
	var speed_scale = speed_multiplier*3 + 1
	move_speed = speed_scale*move_speed
	$AnimatedSprite.speed_scale = speed_scale
	modulate = lerp(Color(1, 1, 1), Color(1, 0.3, 0.3), speed_multiplier)

func _physics_process(delta):
	# movement vector
#	var move: Vector2 = Vector2()
	
	if !$RightRayCast.is_colliding() or !$LeftRayCast.is_colliding() or is_on_wall():
		move.x *= -1
	
	# tweak animations
	if move.x < 0:
		$AnimatedSprite.flip_h = false
	elif move.x > 0:
		$AnimatedSprite.flip_h = true
	
	# calculate physics
	velocity += acceleration*delta
	velocity.x = move.x*move_speed
	velocity = move_and_slide(velocity, Vector2(0, -1))

	for c in get_slide_count():
		var collision: KinematicCollision2D = get_slide_collision(c)
		if abs(collision.normal.x) > 0.9 and abs(collision.normal.y) < 0.1 and collision.collider.is_in_group("player"):
			collision.collider.hurt()
#			move.x *= -1

func die():
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("die")