extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var counter = 0
export var test = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func score():
	counter += 1
	text = str(counter)
