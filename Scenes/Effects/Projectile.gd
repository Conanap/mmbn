extends Node2D

class_name Projectile

var speed : int

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Projectile_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
