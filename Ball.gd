extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = PongConfig.bspeed
var x = PongConfig.bextends
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	# apply initial impuls to move the ball 
	screen_size = get_viewport().size
	_add_collision_shape()
	
func start():
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
	var rand_gen = RandomNumberGenerator.new()
	rand_gen.randomize()
	var deg = rand_gen.randi_range(225, 315)
	var angle = deg2rad(deg)
	var sinus = sin(angle)
	var start_impuls = Vector2(sinus, cos(angle)) * speed
	apply_impulse(Vector2(0,0), start_impuls)
	
	
func _add_collision_shape():
	# var shape = RectangleShape2D.new()
	# shape.set_extents(Vector2(x / 2, x/2))
	var shape = CircleShape2D.new()
	shape.set_radius(x)
	get_child(0).set_shape(shape)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	draw_rect(Rect2(- x / 2 , - x / 2, x, x), Color.white) 
