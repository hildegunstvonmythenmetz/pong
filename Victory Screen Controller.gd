extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CenterContainer/VBoxContainer/Label").text = "YOU WON" if PongConfig.won else "YOU LOST"
	

func menu():
	get_tree().change_scene("res://scenes/Menu.tscn")
	
func rematch():
	get_tree().change_scene("res://scenes/Pong.tscn")
