extends Chars

class_name Player

export (PackedScene) var proj
export (PackedScene) var otObj

var Bullet = preload('res://Scenes/Effects/Bullet.tscn')

var input_disabled = true

func _init(var initx=1, var inity=1, var inithealth=100):
	charx = initx
	chary = inity
	health = inithealth

func _ready():
	# connecting to event bus
	EventBus.connect("disablePlayerInput", self, "_on_disable_player_input")

	EventBus.emit_signal("health_player_update", self.health)

	$PItemSpwnPt.position = self.position + Vector2(27, 0)

func _input(event):
	if input_disabled:
		return

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
		spawn_item("bullet")

	if event.is_action_pressed("draw"):
		EventBus.emit_signal("drawSummoned")

func spawn_item(itemType):
	var item;

	if itemType == 'bullet':
		item = Bullet.instance()
		item.OGGrp = "Player"

	if !item:
		print("cannot identify item type / cannot instanciate item")
		return null

	# owner.add_child will add to global
	owner.add_child(item)
	$PItemSpwnPt.position = self.position + Vector2(item.size.x / 2 + 27, 0)
	item.transform = $PItemSpwnPt.transform

func change_health(var health : int):
	.change_health(health)
	emit_signal("health_player_update", self.health)
	
func _on_disable_player_input(var val : bool):
	self.input_disabled = val
