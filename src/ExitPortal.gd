extends Area2D

func _ready():
	pass


func _on_ExitPortal_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://Win.tscn")