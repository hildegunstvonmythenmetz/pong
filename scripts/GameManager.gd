extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ball_scene

var ball
var enemy
var enemy_score
var player_score

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
        get_tree().change_scene("res://scenes/Menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ball_scene = load("res://scenes/Ball.tscn")
	enemy = get_node("Enemy")
	_restart()
	enemy_score = 0
	player_score = 0
	
func _restart():
	if (ball):
		ball.free()
	ball = ball_scene.instance()
	add_child(ball)
	ball.start()
	enemy.set_target(ball)

	
func _on_Trigger_Left_body_entered(body):
	if (body.name == "Ball"):
		enemy_score += 1
		get_node("Right/Counter").score(enemy_score)
		_restart()
		_point_scored()


func _on_Trigger_Right_body_entered(body):
	if (body.name == "Ball"):
		player_score += 1
		get_node("Left/Counter").score()
		_restart()
		_point_scored()

func _point_scored():
	if player_score == PongConfig.goal or enemy_score == PongConfig.goal:
		PongConfig.won = player_score == PongConfig.goal
		var vicotory_scene = load("res://scenes/Victory Screen.tscn")
		get_tree().change_scene_to(vicotory_scene)
