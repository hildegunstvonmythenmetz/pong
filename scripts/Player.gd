extends CollisionShape2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var height = PongConfig.height
var width = PongConfig.width

var screen_size = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	_add_collision_shape()
	screen_size = get_viewport_rect().size
	owner.set_meta("Player", true)
	
func _add_collision_shape():
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(width / 2, height/2))
	set_shape(shape)

func _draw():
	draw_rect(Rect2(Vector2(- width / 2, - height / 2), Vector2(width, height)), Color.white)
