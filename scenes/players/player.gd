extends CharacterBody2D

@export var speed: int

func _process(_delta):
	var direction: Vector2
	
	if(Input.is_action_pressed("move_down")):
		direction = Vector2.DOWN
	if(Input.is_action_pressed("move_up")):
		direction = Vector2.UP
	
	velocity = direction * speed
	move_and_slide()


func _on_area_2d_body_entered(body):
	if ('bounce' in body):
		$CollisionShape2D/Node2D/AudioStreamPlayer2D.play()
