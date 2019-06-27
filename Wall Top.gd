extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 0
	position.y = 0
	_add_wall_collider(1)
	_add_wall_collider(-1)


func _add_wall_collider(pos):
	var screen = get_viewport_rect()
	var col_height = 12
	
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(screen.size.x, col_height/2))
	shape

	var collision = CollisionShape2D.new()
	collision.position.x = int(screen.size.x / 2)
	var offset = 0
	if pos > 0:
		offset = 1
	collision.position.y = int((col_height / 2) * pos + (offset * screen.size.y))
	
	collision.set_shape(shape)

	add_child(collision)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
