extends StaticBody2D



func _on_area_2d_body_entered(body):
	if ('bounce' in body):
		$Node2D/AudioStreamPlayer2D.play()
