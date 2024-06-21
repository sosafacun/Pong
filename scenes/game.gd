extends Node2D

func _ready():
	%PlayerScoreLabel.text = str(Globals.player_score)
	%CPUScoreLabel.text = str(Globals.cpu_score)
	$Ball.set_starting_velocity()

func reset_positions():
	$Ball.position = Vector2.ZERO
	$Ball.set_starting_velocity()
	Globals.ball_position = $Ball.position
	%Player.position.y = 0
	%CPU.position.y = 0


func _on_left_area_updated_scores():
	reset_positions()

func _on_right_area_updated_scores():
	reset_positions()
