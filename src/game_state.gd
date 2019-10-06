extends Resource

signal health_changed

class_name GameState

const max_health = 10

var health: int = max_health setget set_health

func set_health(new_health):
	health = new_health
	emit_signal("health_changed", new_health)