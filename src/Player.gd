extends KinematicBody2D

const gravity = 300

var acceleration = Vector2(0, gravity)
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity += acceleration*delta
	velocity = move_and_slide(velocity, Vector2(0, 1))