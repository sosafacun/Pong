extends CharacterBody2D

@export var start_speed: float
@onready var speed: float = start_speed
const ACCELERATION: float = 2

func _ready():
	set_starting_velocity()

func _physics_process(delta):
	bounce(delta)

func bounce(delta):
	var collision_info = move_and_collide(velocity * speed * delta)
	
	Globals.ball_position = position
	
	if (collision_info):
		var collider = collision_info.get_collider()
		if('IS_PADDLE' in collider):
			if(speed <= 40):
				speed += ACCELERATION
			velocity = (pong_bounce(collider))
		else:
			velocity = velocity.bounce(collision_info.get_normal())

func pong_bounce(collider):
	var distance = Globals.ball_position.y - collider.position.y
	var new_bounce: Vector2
	const MAX_BOUNCE_RANGE: float = 0.6
	
	if velocity.x > 0:
		new_bounce.x = -1
	else:
		new_bounce.x = 1
	
	new_bounce.y = (distance / (collider.collision_height / 2)) * MAX_BOUNCE_RANGE
	return new_bounce.normalized() * speed
	

func set_starting_velocity():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1
	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y = -1
	speed = start_speed
	velocity *= speed
