extends Control

# https://vercel.com/jackaduxs-projects/web-test

@onready var node_2d = $Node2D

var _t:float = 0
var pos_list = []
var start_p = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	start_p = $Icon.position


func _process(delta):
	if pos_list.size()>300:
		pos_list.pop_front()
	_t += delta
	$Icon.rotation += delta
	$Icon.position.y += sin(_t)
	$Icon.position.x += cos(_t)
	if _t > pos_list.size()/10.0:
		pos_list.append($Icon.position)
	queue_redraw()

func _on_button_pressed():
	var label = $Label
	label.text = str(randf())

func _draw():
	draw_polyline(pos_list, Color.AQUA, 5, true)
