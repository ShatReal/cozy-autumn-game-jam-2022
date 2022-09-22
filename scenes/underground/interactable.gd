extends TextureButton


export var dialogue: PoolStringArray
export var pickup := false


func _on_Interactable_mouse_entered() -> void:
	modulate = Color(2, 2, 2, 1)


func _on_Interactable_mouse_exited() -> void:
	modulate = Color.white
