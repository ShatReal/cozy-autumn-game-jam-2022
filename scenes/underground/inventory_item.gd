extends TextureButton
class_name InventoryItem


func _on_InventoryItem_mouse_entered() -> void:
	modulate = Color(2, 2, 2, 1)


func _on_InventoryItem_mouse_exited() -> void:
	modulate = Color.white


func _on_InventoryItem_pressed() -> void:
	if $Selected.visible:
		$Selected.hide()
	else:
		$Selected.show()
		for other_button in group.get_buttons():
			if not other_button == self:
				other_button.get_node("Selected").hide()
