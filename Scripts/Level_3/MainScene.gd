extends Node2D

var is_closed = 1
var bracings = []
var corrects = 0

func _ready():
	$LevelUI.update_score(0)
	PathToScene.pathToScene = "res://Scenes/Level3/MainScene.tscn"
	bracings = get_tree().get_nodes_in_group("brac")
	for br in bracings:
		br.hide()
	$loop.hide()
	$LevelUI.time = 90
	$Stand.stop()
	$panel.hide()
	$Arm.frame = 0
	$Stand.frame = 0
	
func _process(delta):
	for i in range(15, -1, -1):
		if bracings[i].triggered:
			bracings[i].set_highlite()
			break
		else:
			bracings[i].set_usual()

func _on_AnimatedSprite_animation_finished():
	$Stand.stop()
	$Stand.frame = 3
	is_closed = 0
	for br in bracings:
		br.show()
	$loop.show()


func _on_Arm_animation_finished():
	$Arm.stop()
	$Arm.frame = 4
	$Stand.play("default")


func _on_Area2D_body_entered(body):
	if is_closed:
		$Arm.play("default")


func _on_loop_toggled(button_pressed):
	if button_pressed:
		$panel.show()
	else:
		$panel.hide()

func count_corrects():
	corrects =corrects + 1
	$LevelUI.update_score(corrects)
	if corrects > 14:
		get_tree().change_scene("res://Scenes/Menu/Winning.tscn")
