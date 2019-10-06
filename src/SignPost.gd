extends Area2D

func _ready():
	pass


func _on_SignPost_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("show")

func _on_SignPost_body_exited(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("hide")