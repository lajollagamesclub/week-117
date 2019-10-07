extends MarginContainer

func _ready():
	AudioServer.set_bus_mute(0, Settings.d["muted"])

func _input(event):
	if event.is_action_pressed("g_pause"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused

func _on_MuteButton_pressed():
	Settings.d["muted"] = !Settings.d["muted"]
	AudioServer.set_bus_mute(0, Settings.d["muted"])

func _on_ResumeButton_pressed():
	get_tree().paused = false
	visible = false