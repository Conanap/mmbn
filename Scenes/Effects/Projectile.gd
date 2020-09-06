extends Node2D

class_name Projectile

# must be set on init:
# speed
var speed : int

# must be set on ready:
# size
var size

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Projectile_area_entered(body):
	if body.is_in_group('chars'):
		queue_free()
