extends CharacterBody2D

@export var speed: int

func _physics_process(delta):
	if (Globals.ball_position.y < position.y):
		velocity.y = -1
	else:
		velocity.y = 1
	velocity *= speed
	
	move_and_collide(velocity * delta)

func _on_area_2d_body_entered(body):
	if ('bounce' in body):
		$Node2D/AudioStreamPlayer2D.play()
