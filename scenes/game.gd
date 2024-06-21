extends Node2D


func _on_player_area_body_entered(body):
	if ('bounce' in body):
		%PlayerArea.play_sound()
		reset_ball()


func _on_cpu_area_body_entered(body):
	if ('bounce' in body):
		%CPUArea.play_sound()
		reset_ball()

func reset_ball():
	$Ball.position = Vector2.ZERO
	Globals.ball_position = $Ball.position
