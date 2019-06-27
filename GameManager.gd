extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ball_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	ball_scene = load("res://Ball.tscn")
	_restart()
	
func _restart():
	if (PongConfig.ball):
		PongConfig.ball.free()
	PongConfig.ball = ball_scene.instance()
	add_child(PongConfig.ball)
	PongConfig.ball.start()
	
func _on_Trigger_Left_body_entered(body):
	if (body.name == "Ball"):
		get_node("Right/Counter").score()
		_restart()


func _on_Trigger_Right_body_entered(body):
	if (body.name == "Ball"):
		get_node("Left/Counter").score()
		_restart()
