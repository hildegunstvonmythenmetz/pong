extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = PongConfig.bspeed
var x = PongConfig.bextends
var screen_size
var started = false
var speed_o_meter
var motion

func _ready():
	screen_size = get_viewport().size
	speed_o_meter = get_node("Speed Display")
	_add_collision_shape()
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
	
func start():

	var rand_gen = RandomNumberGenerator.new()
	rand_gen.randomize()
	var deg = rand_gen.randi_range(225, 315)
	var angle = deg2rad(deg)
	var dir = Vector2(sin(angle), cos(angle)).normalized()
	motion = dir * speed
	started = true
	
func _add_collision_shape():
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(x / 2,x / 2))
	get_child(0).set_shape(shape)

func _physics_process(delta):
	if not started:
		return
	var collision = move_and_collide(motion * delta)
	
	if collision:
		# reset speed if the ball gets hit by a racket
		if collision.collider.get_meta("Player"):
			motion = motion.normalized() * speed
		# calculate new direction
		var normal = collision.normal
		
		var adjacent = (motion.dot(normal)) * normal
		var opposite = motion - adjacent
		
		# include motions of a racket into the direction of the ball
		opposite += (collision.collider_velocity / 2)

		motion = opposite - adjacent
		
		# limit the angle of a shot
		var motion_speed = motion.length() if motion.length() >= speed else speed
		motion = motion.normalized()
		motion.y = clamp(motion.y, -0.8, 0.8)
		motion = motion * motion_speed
		
	var distance = motion.length()
	speed_o_meter.text = str(distance / delta) 

func _draw():
	draw_rect(Rect2(- x / 2 , - x / 2, x, x), Color.white) 