extends Underground


func _ready() -> void:
	interactions = {
		"Hotplate": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't think the plate gets hot enough to melt these metal bars."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't think I could burn the door down."])
			},
			"Axe": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Do I throw the hotplate at the axe?"])
			},
			"Ice": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's melt the ice with the hotplate!"])
			},
			"Bow": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't want to burn this!"])
			}
		},
		"Bow": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I could shoot out the windows but I might hit someone."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|These arrows can't break the door."])
			},
			"Axe": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's shoot the axe down!"])
			},
		},
		"Axe": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't reach the window."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Whacky whack!"])
			},
		},
	}


func check_interaction() -> void:
	if selected_item and selected_item.name == "Hotplate" and cur_int.name == "Ice":
		$Control/Interactables/Ice.queue_free()
		$Control/Interactables/Bow.show()
	elif selected_item and selected_item.name == "Bow" and cur_int.name == "Axe":
		$Control/Interactables/Axe.queue_free()
		give_item("res://scenes/underground/level_3/axe.png", "Axe")
	elif selected_item and selected_item.name == "Axe" and cur_int.name == "Door":
		$Control/Interactables/Door.queue_free()
		$DoorDestroyed.show()
		victory()
