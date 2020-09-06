extends TileMap

class_name Grid

export var grid_s_x = 3
export var grid_s_y = 3

enum CHARTYPE { PLAYER, ENEMY }

export(CHARTYPE) var charType = CHARTYPE.PLAYER

var AllyPanel = preload("res://Scenes/Stage/Elements/PlayerPanel.tscn")
var EnemyPanel = preload("res://Scenes/Stage/Elements/EnemyPanel.tscn")

func _ready():
	spawn_panels()

func try_to_move_to(var pos : Vector2, var dir : Vector2):
	var grid_pos = world_to_map(pos)
	var tgt = grid_pos + dir
	
	# catch out of bounds
	if tgt.x < 0 || tgt.x >= grid_s_x:
		tgt.x = grid_pos.x
	if tgt.y < 0 || tgt.y >= grid_s_y:
		tgt.y = grid_pos.y

	return map_to_world(tgt) + cell_size / 2

func spawn_panels():
	var panelInit = null
	var panel = null

	if charType == CHARTYPE.PLAYER:
		panelInit = AllyPanel
	elif charType == CHARTYPE.ENEMY:
		panelInit = EnemyPanel

	if !panelInit:
		print("cannot determine chartype")
		return null

	for x in grid_s_x:
		for y in grid_s_y:
			panel = panelInit.instance()
			self.add_child(panel)
			panel.set_owner(self)
			panel.set_name("panel" + str(x) + str(y))
			panel.position = map_to_world(Vector2(x, y))
