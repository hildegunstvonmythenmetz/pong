extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = get_viewport().size.x / 2
	position.y = 0

func _draw():
		draw_dashed_line(Vector2(0,0), Vector2(0,get_viewport().size.y), Color.white, 5, 41)

func draw_dashed_line(from: Vector2, to: Vector2, color, width, dashes = 5):
	var length = (to - from).length()
	# Richtungsvektor
	var normal = (to - from).normalized()
	var dash_length = length / dashes
	var dash_step = normal * dash_length
	
	if length < dash_length: #not long enough to dash
		draw_line(from, to, color, width)
		return

	else:
		var draw_flag = true
		var segment_start = from
		var steps = length/dash_length
		for start_length in range(0, steps + 1):
			var segment_end = segment_start + dash_step
			if draw_flag:
				draw_line(segment_start, segment_end, color, width)

			segment_start = segment_end
			draw_flag = !draw_flag