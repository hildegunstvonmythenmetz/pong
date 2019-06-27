extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var width = PongConfig.width
var speed = PongConfig.speed

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = (get_viewport_rect().size.x /2) + (PongConfig.screen_width / 2) - (PongConfig.width / 2)
	position.y = get_viewport_rect().size.y / 2

func _process(delta):
	if (not PongConfig.ball):
		return
	var diff_speed = clamp(PongConfig.ball.position.y - position.y, -speed, speed)
	move_and_collide(Vector2(0, diff_speed))
