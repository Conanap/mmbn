extends Chars

class_name Player

export (PackedScene) var proj
export (PackedScene) var otObj

var Bullet = preload('res://Scenes/Effects/Bullet.tscn')

func _init(var initx=1, var inity=1, var inithealth=100):
	charx = initx
	chary = inity
	health = inithealth

func _ready():
	$PItemSpwnPt.position = self.position + Vector2(27, 0)

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
		var newPos = Grid.try_to_move_to(self.position, dir)
		move_to_pane(newPos)
		$PItemSpwnPt.position = newPos + Vector2(27, 0)

	if event.is_action_pressed("attack") :
		print('attack!')
		spawn_item("bullet")

func spawn_item(itemType):
	var item;

	if itemType == 'bullet':
		item = Bullet.instance()

	if !item:
		print("cannot identify item type / cannot instanciate item")
		return null

	# owner.add_child will add to global
	owner.add_child(item)
	item.transform = $PItemSpwnPt.transform
