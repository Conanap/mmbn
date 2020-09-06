extends Node2D

class_name Projectile

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
