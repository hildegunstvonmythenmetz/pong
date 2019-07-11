extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var initial_speed = PongConfig.bspeed
var x = PongConfig.bextends
var screen_size
var started = false
var motion
var speed
var dir

func _ready():
	screen_size = get_viewport().size
	_add_collision_shape()
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
	
func start():

	var rand_gen = RandomNumberGenerator.new()
	rand_gen.randomize()
	var deg = rand_gen.randi_range(225, 315)
	var angle = deg2rad(deg)
	dir = Vector2(sin(angle), cos(angle)).normalized()
	# motion = dir * initial_speed
	speed = initial_speed
	get_node("Timer").start(3)

	
	
	
func _add_collision_shape():
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(x / 2,x / 2))
	get_child(0).set_shape(shape)

func _physics_process(delta):
	if not started:
		return
	motion = dir * speed
	var collision = move_and_collide(motion * delta)
	
	if collision:
		# calculate new direction
		var normal = collision.normal
		
		var adjacent = (dir.dot(normal)) * normal
		var opposite = dir - adjacent
	
		dir = opposite - adjacent
		
		# reset speed if the ball gets hit by a racket
		if collision.collider.get_meta("Player"):
			speed = initial_speed

			# calculate relative speed of the player
			var player_velocity = collision.collider_velocity
			var max_player_velocity = PongConfig.speed
			var relative_player_velocity = player_velocity.y / max_player_velocity

			dir.y += relative_player_velocity

			if relative_player_velocity < 0:
				relative_player_velocity *= -1
			speed += relative_player_velocity * 100
			# limit the angle of a shot
			dir.y = clamp(dir.y, -0.8, 0.8)
		dir = dir.normalized()

	var distance = motion.length()


func _draw():
	draw_rect(Rect2(- x / 2 , - x / 2, x, x), Color.white) 


func _on_Timer_timeout():
	started = true
