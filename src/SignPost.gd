tool
extends Area2D

export (String) var text = "testing text" setget set_text

func _ready():
	if not Engine.editor_hint: # hide notices when game starts
		$MarginContainer.rect_scale = Vector2(0.1, 1)
		$MarginContainer.modulate = Color("00ffffff")

func set_text(new_text):
	text = new_text
	if has_node("MarginContainer/MarginContainer/Label"):
		$MarginContainer/MarginContainer/Label.text = new_text

func _on_SignPost_body_entered(body):
	if body.is_in_group("player") and not Engine.editor_hint:
		$AnimationPlayer.play("show") 

func _on_SignPost_body_exited(body):
	if body.is_in_group("player") and not Engine.editor_hint:
		$AnimationPlayer.play("hide")