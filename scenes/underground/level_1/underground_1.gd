extends Underground

func _ready() -> void:
	interactions = {
		"Stick": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|(pokes bars with stick) Nothing's happening, I don't know what I expected."])
			},
			"Lockpick": {
				"pickup": true,
				"dialogue": PoolStringArray(["Player|I can use the stick to reach the lockpick!"])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|(pokes door with stick) Shoot, it didn't open."])
			},
		},
		"Lockpick": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't I can pick this window open."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can pick this door open!"])
			}
		}
	}


func check_interaction() -> void:
	if selected_item and selected_item.name == "Lockpick" and cur_int.name == "Door":
		$Control/Interactables/Door.queue_free()
		victory()
