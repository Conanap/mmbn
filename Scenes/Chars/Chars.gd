extends Area2D

class_name Chars

export var health = 100
export var charx = 1
export var chary = 1

onready var Grid = get_parent()

func _init(var initx=1, var inity=1, var inithealth=100):
	charx = initx
	chary = inity
	health = inithealth
	self.add_to_group('chars')

func _ready():
	move_to_pane(Grid.try_to_move_to(self.position, Vector2(charx, chary)))

func move_to_pane(var dir):
	set_process(false)
	self.position = dir
	set_process(true)
