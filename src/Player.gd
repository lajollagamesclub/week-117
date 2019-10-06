extends KinematicBody2D

const gravity = 700
const move_speed = 150
const jump_speed = 200

var acceleration = Vector2(0, gravity)
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	# movement vector
	var move: Vector2 = Vector2()
	
	# fetching input
	move.x = int(Input.is_action_pressed("g_right")) - int(Input.is_action_pressed("g_left"))
	move.y = int(Input.is_action_just_pressed("g_jump") and (is_on_floor() or is_on_wall()))
	
	# tweak animations
	if abs(move.x) > 0:
		$AnimatedSprite.play("right")
	else:
		$AnimatedSprite.play("default")
	if move.x < 0:
		$AnimatedSprite.flip_h = true
	elif move.x > 0:
		$AnimatedSprite.flip_h = false
	# calculate physics
	velocity += acceleration*delta
	velocity.x = move.x*move_speed
	if abs(move.y) > 0:
		if is_on_wall():
			var new_dust_particles = preload("res://DustParticles.tscn").instance()
			get_parent().add_child(new_dust_particles)
			new_dust_particles.global_position = global_position + Vector2(0, 5)
		velocity.y = -move.y*jump_speed
	velocity = move_and_slide(velocity, Vector2(0, -1))
	for c in get_slide_count():
		var collision: KinematicCollision2D = get_slide_collision(c)
		if collision.normal.y < -0.9 and collision.normal.x < 0.1 and collision.collider.is_in_group("goomba"):
			collision.collider.die()
			velocity.y = -jump_speed*2

func hurt():
	print("ouch")