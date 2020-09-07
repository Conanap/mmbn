extends Chars

class_name Enemy

func _init(var initx=1, var inity=1, var inithealth=100):
	charx = initx
	chary = inity
	health = inithealth

func _process(_delta):
	var dir = Vector2()
