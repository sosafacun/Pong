extends Area2D

@export var is_player: bool

signal updated_scores

func play_sound():
	if(is_player):
		increment($CPUScore)
		Globals.cpu_score += 1
		%CPUScoreLabel.text = str(Globals.cpu_score)
		updated_scores.emit()
	else:
		increment($PlayerScore)
		Globals.player_score += 1
		%PlayerScoreLabel.text = str(Globals.player_score)
		updated_scores.emit()

func increment(audio: AudioStreamPlayer2D):
	audio.play()
	var tween = create_tween()
	tween.tween_property(audio, "volume_db", 0, 0.5)


func _on_body_entered(_body):
	play_sound()
