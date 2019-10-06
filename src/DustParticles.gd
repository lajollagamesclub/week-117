extends CPUParticles2D

func _ready():
	get_tree().create_timer(lifetime).connect("timeout", self, "queue_free")
	emitting = true