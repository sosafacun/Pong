extends Node2D

signal return_menu

func _ready():
	%PlayerScoreLabel.text = str(Globals.player_score)
	%CPUScoreLabel.text = str(Globals.cpu_score)
	$Ball.set_starting_velocity()

func _process(_delta):
	if (Input.is_action_pressed("main_menu")):
		return_menu.emit()

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

func _on_return_menu():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
