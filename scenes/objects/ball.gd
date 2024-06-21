extends CharacterBody2D

const ACCELERATION = 200
@export var start_speed: int = 250
@onready var speed: int = start_speed

func _ready():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1
	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y = -1
	velocity *= speed

func _physics_process(delta):
	bounce(delta)

func bounce(delta):
	var collision_info = move_and_collide(velocity * delta)
	Globals.ball_position = position
	if (collision_info):
		velocity = velocity.bounce(collision_info.get_normal())
		speed += ACCELERATION
