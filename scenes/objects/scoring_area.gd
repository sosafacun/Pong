extends Area2D

@export var is_player: bool

func play_sound():
	if(is_player):
		$CPUScore.play()
	else:
		$PlayerScore.play()
