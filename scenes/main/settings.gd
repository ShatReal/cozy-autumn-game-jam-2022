extends PopupPanel


const PATH := "user://settings.ini"

var config: ConfigFile


func _ready() -> void:
	config = ConfigFile.new()
	if not config.load(PATH) == OK:
		return
	var music = config.get_value("audio", "music", 1.0)
	if music is float and music >= 0.0 and music <= 1.0:
		AudioServer.set_bus_volume_db(0, linear2db(music))
		$VBoxContainer/HBoxContainer/Music.value = music
	var sound = config.get_value("audio", "sound", 1.0)
	if sound is float and sound >= 0.0 and sound <= 1.0:
		AudioServer.set_bus_volume_db(1, linear2db(sound))
		$VBoxContainer/HBoxContainer2/Sound.value = sound


func _on_Music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear2db(value))
	config.set_value("audio", "music", value)
	config.save(PATH)


func _on_Sound_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear2db(value))
	config.set_value("audio", "sound", value)
	config.save(PATH)
