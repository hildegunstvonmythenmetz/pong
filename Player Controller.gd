extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = PongConfig.speed
var width = PongConfig.width

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = (get_viewport_rect().size.x /2) - (PongConfig.screen_width / 2) + (PongConfig.width / 2)
	position.y = get_viewport_rect().size.y / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vel = int(Input.is_action_pressed("move_down")) + (int(Input.is_action_pressed("move_up")) * -1)
	move_and_collide(Vector2(0, vel * delta * speed))
