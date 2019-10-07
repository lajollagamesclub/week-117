extends Node

const settings_path = "user://settings.json"

var default_settings: Dictionary = {
	"muted": false
}
var d: Dictionary = {}

func _ready():
	connect("tree_exiting", self, "write_settings")
	
	var settings_file: File = File.new()

	if settings_file.file_exists(settings_path):
		settings_file.open(settings_path, File.READ)
		var json_text: String = settings_file.get_as_text()
		d = parse_json(json_text)
		settings_file.close()

	else:
		d = default_settings.duplicate(true)

func write_settings():
	print("writing settings")
	var settings_file: File = File.new()
	settings_file.open(settings_path, File.WRITE)

	settings_file.store_string(to_json(d))
	settings_file.close()
