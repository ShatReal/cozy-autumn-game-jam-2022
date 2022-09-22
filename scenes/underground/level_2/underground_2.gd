extends Underground


func _ready() -> void:
	interactions = {
		"Cheese": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't think windows eat cheese."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Maybe if I shove the cheese under the door? Nah, that's dumb."])
			},
			"Hole": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Here's some food for you, Mr. Mouse!"])
			}
		},
		"Key": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The window doesn't have a lock on it."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's get out of here! Again!"])
			},
			"Hole": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to put the key back into the hole."])
			}
		}
	}


func check_interaction():
	if cur_int.name == "Box":
		$Control/Interactables/Box.queue_free()
		give_item("res://scenes/underground/level_2/cheese.png", "Cheese")
	elif selected_item and selected_item.name == "Cheese" and cur_int.name == "Hole":
		$Control/Interactables/Hole/Mouse.show()
		$Control/Interactables/Key.show()
		$Control/Inventory/Scroll/Items.get_node("Cheese").queue_free()
	elif selected_item and selected_item.name == "Key" and cur_int.name == "Door":
		$Control/Interactables/Door.queue_free()
		victory()
