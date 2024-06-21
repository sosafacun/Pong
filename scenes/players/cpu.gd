extends CharacterBody2D

@export var speed: int
@export var block_variability: float = 0.4
const IS_PADDLE: bool = true

func _physics_process(delta):
	if(abs(Globals.ball_position.y - position.y) < 50):
		return
	
	if (Globals.ball_position.y < position.y):
		velocity.y = (block_variability * -1)
	else:
		velocity.y = block_variability
	velocity *= speed
	
	move_and_collide(velocity * delta)

func _on_area_2d_body_entered(body):
	if ('bounce' in body):
		$Node2D/AudioStreamPlayer2D.play()
		if (block_variability <= 1):
			block_variability += 0.15
			print(block_variability)
