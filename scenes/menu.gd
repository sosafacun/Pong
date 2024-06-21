extends Control

signal start

func _process(delta):
	if(Input.is_action_pressed("start")):
		start.emit()
	


func _on_start():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
