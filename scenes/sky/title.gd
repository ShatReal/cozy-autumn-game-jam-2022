extends Node2D


signal change_scene(to, transition)

const TWEEN_TIME := 0.5
const SAVE_PATH := "user://saves.save"


func _ready() -> void:
	var file := ConfigFile.new()
	if not file.load(SAVE_PATH) == OK:
		return
	if not file.get_value("data", "unlocked", 0) is int:
		return
	var unlocked: int = file.get_value("data", "unlocked", 0)
	if unlocked == 0:
		return
	for i in range(1, min(unlocked, 5) + 1):
		get_node("HBox/Levels/VBox/Level%s" % i).disabled = false


func _on_LevelSelect_pressed() -> void:
	if $Tween.is_active():
		return
	$Tween.interpolate_property($HBox, "rect_position:x", $HBox.rect_position.x, -1920, TWEEN_TIME)
	$Tween.start()


func _on_Credits_pressed() -> void:
	if $Tween.is_active():
		return
	$Tween.interpolate_property($HBox, "rect_position:x", $HBox.rect_position.x, -1920*2, TWEEN_TIME)
	$Tween.start()


func _on_Back_pressed() -> void:
	if $Tween.is_active():
		return
	$Tween.interpolate_property($HBox, "rect_position:x", $HBox.rect_position.x, 0, TWEEN_TIME)
	$Tween.start()


func on_level_pressed(to: String) -> void:
	if $Tween.is_active():
		return
	emit_signal("change_scene", to, Vector2.DOWN)


func _on_Credits_meta_clicked(meta) -> void:
	if $Tween.is_active():
		return
	OS.shell_open(meta)


func _on_Settings_pressed() -> void:
	if $Tween.is_active():
		return
	$Settings.popup_centered()
