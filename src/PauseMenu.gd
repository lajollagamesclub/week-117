extends MarginContainer

var muted: bool = false

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("g_pause"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused

func _on_MuteButton_pressed():
	muted = !muted
	AudioServer.set_bus_mute(0, muted)

func _on_ResumeButton_pressed():
	get_tree().paused = false
	visible = false