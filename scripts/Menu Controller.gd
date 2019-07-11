extends Node

func load_pong():
	get_tree().change_scene("res://scenes/Pong.tscn")

func quit():
	get_tree().quit()
