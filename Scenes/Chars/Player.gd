extends Chars

class_name Player

func _init(var initx=1, var inity=1, var inithealth=100):
	charx = initx
	chary = inity
	health = inithealth

func _input(event):
	var dir = Vector2()
	if event.is_action_pressed("ui_right"):
		dir.x += 1
	elif event.is_action_pressed("ui_left"):
		dir.x -= 1
	if event.is_action_pressed("ui_down"):
		dir.y += 1
	elif event.is_action_pressed("ui_up"):
		dir.y -= 1

	if dir.x || dir.y:
		move_to_pane(Grid.try_to_move_to(self.position, dir))

	if event.is_action_pressed("attack") :
		print('attack!')

