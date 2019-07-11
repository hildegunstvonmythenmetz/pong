extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ball_scene

var ball
var enemy

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
        get_tree().change_scene("res://scenes/Menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ball_scene = load("res://scenes/Ball.tscn")
	enemy = get_node("Enemy")
	_restart()
	
func _restart():
	if (ball):
		ball.free()
	ball = ball_scene.instance()
	add_child(ball)
	ball.start()
	enemy.set_target(ball)
	
func _on_Trigger_Left_body_entered(body):
	if (body.name == "Ball"):
		get_node("Right/Counter").score()
		_restart()


func _on_Trigger_Right_body_entered(body):
	if (body.name == "Ball"):
		get_node("Left/Counter").score()
		_restart()


func _on_Timer_timeout():
	# PongConfig.ball.start()
	pass
