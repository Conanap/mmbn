extends Area2D

export var health = 100
export var charx = 1
export var chary = 1

onready var Grid = get_parent()

func _init(var initx=1, var inity=1, var inithealth=100):
	charx = initx
	chary = inity
	health = inithealth

func _ready():
	move_to_pane(Grid.try_to_move_to(self.position, Vector2(charx, chary)))

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

func move_to_pane(var dir):
	set_process(false)

	self.position = dir
	# $AnimationPlayer.play("move")

	set_process(true)