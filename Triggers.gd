extends Area2D


var width
var screen
# -1 or 1
export var position_multiplier = 1

func _ready():
	position.x = 0
	position.y = 0
	screen = get_viewport_rect()
	width = (screen.size.x - PongConfig.screen_width) /2
	_add_wall_collider(position_multiplier)


func _add_wall_collider(pos):
	
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(width, screen.size.y))


	var collision = get_child(0)
	var x_center = screen.size.x / 2
	var x_center_offset = ((PongConfig.screen_width / 2) * pos)
	collision.position.x = x_center + x_center_offset + (width * pos)
	collision.position.y = screen.size.y / 2
	
	collision.set_shape(shape)