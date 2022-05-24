extends Node2D

var highlited = preload("res://Sprites/third_level/hole_y.png")
var usual = preload("res://Sprites/third_level/hole.png")
var is_usual = 1
var triggered = 0

func _ready():
	$Area2D.set_pickable(true)

func set_usual():
	$Sprite.texture = usual
	
	
func set_highlite():
	$Sprite.texture = highlited
	

func _on_Area2D_mouse_entered():
	print(1)
	triggered = 1

func _on_Area2D_mouse_exited():
	triggered = 0


func _on_Area2D_input_event(viewport, event, shape_idx):
	var draw = get_node("../CanvasLayer")
	if event is InputEventMouseButton:
		if (not event.pressed) and (draw.start != event.global_position):
			draw.end = event.global_position
		else:
			draw.start = event.global_position
	
