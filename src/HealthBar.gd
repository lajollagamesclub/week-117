extends ProgressBar

const game_state = preload("res://game_state.tres")

func _ready():
	_on_health_changed(game_state.max_health)
	game_state.connect("health_changed", self, "_on_health_changed")

func _on_health_changed(new_health):
	max_value = game_state.max_health
	min_value = 0
	$HealthTween.stop_all()
	$HealthTween.interpolate_property(self, "value", value, new_health, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$HealthTween.start()