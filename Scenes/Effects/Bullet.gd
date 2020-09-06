extends Projectile

class_name Bullet

func _init():
	speed = 500

func _ready():
	size = get_node("CollisionShape2D").shape.extents
