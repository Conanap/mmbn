extends TileMap

export var grid_s_x = 3
export var grid_s_y = 3

func _ready():
	pass

func try_to_move_to(var pos : Vector2, var dir : Vector2):
	var grid_pos = world_to_map(pos)
	var tgt = grid_pos + dir
	
	print("pos:", pos)
	print("grid_pos:", grid_pos)
	# catch out of bounds
	if tgt.x < 0 || tgt.x >= grid_s_x:
		tgt.x = grid_pos.x
	if tgt.y < 0 || tgt.y >= grid_s_y:
		tgt.y = grid_pos.y
	
	print("tgt:", tgt)

	return map_to_world(tgt) + cell_size / 2
