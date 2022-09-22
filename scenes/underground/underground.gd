extends Node2D
class_name Underground


signal change_scene(to, transition)

const SAVE_PATH := "user://saves.save"
const InventoryItem := preload("res://scenes/underground/inventory_item.tscn")

export var queue: Array
export var level_num: int

var current := -1
var cur_int: TextureButton
var bg := ButtonGroup.new()
var interactions: Dictionary
var selected_item


func _ready() -> void:
	for i in $Control/Interactables.get_children():
		i.connect("pressed", self, "on_interactable_pressed", [i])
	if get_parent() == get_tree().get_root():
		advance()


func advance() -> void:
	current += 1
	if current >= queue.size():
		$Blocker.hide()
		return
	if queue[current] is String:
		if $AnimationPlayer.has_animation(queue[current]):
			$AnimationPlayer.play(queue[current])
		else:
			advance()
	else:
		$Control/Dialogue.show_dialogue(queue[current])


func victory() -> void:
	$Music.stream = load("res://sound/victory_track.mp3")
	$Music.play()
	var file := ConfigFile.new()
	if file.load(SAVE_PATH) == OK:
		var unlocked = file.get_value("data", "unlocked", 0)
		if unlocked is int:
			if unlocked < level_num:
				file.set_value("data", "unlocked", level_num+1)
				file.save(SAVE_PATH)
		else:
			file.set_value("data", "unlocked", level_num+1)
			file.save(SAVE_PATH)
	else:
		file.set_value("data", "unlocked", level_num+1)
		file.save(SAVE_PATH)
	$Control/Victory.popup_centered()


func _on_Pause_pressed() -> void:
	$Control/Settings.popup_centered()


func _on_Continue_pressed() -> void:
	emit_signal("change_scene", "res://scenes/ground/level_%s/ground_%s.tscn" % [level_num + 1, level_num + 1], Vector2.UP)


func _on_Dialogue_done() -> void:
	if cur_int:
		if selected_item and interactions[selected_item.name][cur_int.name].pickup or not selected_item and cur_int.pickup:
			pickup()
		check_interaction()
	else:
		advance()


func pickup() -> void:
	var i := InventoryItem.instance()
	$Control/Inventory/Scroll/Items.add_child(i)
	i.name = cur_int.name
	i.group = bg
	i.texture_normal = cur_int.texture_normal
	cur_int.queue_free()
	

func give_item(path: String, n: String) -> void:
	var i := InventoryItem.instance()
	$Control/Inventory/Scroll/Items.add_child(i)
	i.name = n
	i.group = bg
	i.texture_normal = load(path)


func check_interaction() -> void:
	pass
	
	
func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	advance()


func on_interactable_pressed(i: TextureButton) -> void:
	cur_int = i
	selected_item = null
	for button in bg.get_buttons():
		if button.get_node("Selected").visible:
			selected_item = button
			break
	if selected_item == null:
		$Control/Dialogue.show_dialogue(i.dialogue)
	else:
		$Control/Dialogue.show_dialogue(interactions[selected_item.name][i.name].dialogue)
