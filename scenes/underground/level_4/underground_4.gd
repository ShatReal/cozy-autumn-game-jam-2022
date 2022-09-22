extends Underground


func _ready() -> void:
	interactions = {
		"Spring": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I'd just smack right into the bars!"])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Maybe I could headbutt the door? Nah..."])
			},
			"Box": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I could bounce the box on the spring but I'm not sure what that would accomplish."])
			},
			"Crack": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No, it wouldn't fit into there."])
			},
			"Shovel": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Maybe if I throw the shovel at the spring hard enough..."])
			},
			"Dirt": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to bury the spring."])
			},
			"Detonator": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to blow up the spring."])
			},
			"Stick": {
				"pickup": true,
				"dialogue": PoolStringArray(["Player|Let me bounce on the spring to reach the stick."])
			},
		},
		"Stick": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The stick could fit through the bars but I don't think that would be useful."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|(pokes door with stick) Nope, nothing."])
			},
			"Box": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|(pokes box with stick) I don't know what I expected."])
			},
			"Crack": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|There we go!"])
			},
			"Shovel": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I could make the shovel longer, I guess?"])
			},
			"Dirt": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|(pokes at dirt with stick) Nope, not even a worm."])
			},
			"Detonator": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to blow up this stick."])
			},
		},
		"Key": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The window can't be unlocked."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The key doesn't fit."])
			},
			"Box": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I think the key fits here!"])
			},
			"Crack": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No need to put it back."])
			},
			"Shovel": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|This shovel doesn't need unlocking."])
			},
			"Dirt": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No need to bury the key."])
			},
			"Detonator": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to unlock the detonator."])
			},
		},
		"Shovel": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The shovel could fit through the bars but then I'd lose it."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't think I could break down the door with the shovel. It's sturdier than before."])
			},
			"Box": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|(whack) Nope, it's not even dented."])
			},
			"Crack": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The shovel is too big to fit in there."])
			},
			"Dirt": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's go! Diggy dig!"])
			},
			"Detonator": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I already dug it up."])
			},
			"Stick": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Do I combine the two?"])
			},
			"Spring": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I could get hurt by a flying shovel!"])
			},
		},
		"Detonator": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to blow up the window."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I need some explosives to blow up the door."])
			},
			"Box": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I'm not sure what to do here."])
			},
			"Crack": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The detonator is too short to reach the object."])
			},
			"Stick": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't use this to bring it down."])
			},
			"Spring": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to bounce the detonator."])
			},
		},
		"Explosives": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't get the explosives to stay up there."])
			},
			"Door": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I need a detonator..."])
			},
			"Crack": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No need to blow up the crack."])
			},
			"Shovel": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The shovel can't blow up these explosives."])
			},
			"Dirt": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No need to blow up dirt."])
			},
			"Detonator": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I should pick up the detonator."])
			},
		},
	}


func check_interaction() -> void:
	if selected_item and selected_item.name == "Stick" and cur_int.name == "Crack":
		give_item("res://scenes/underground/level_4/key.png", "Key")
	elif selected_item and selected_item.name == "Key" and cur_int.name == "Box":
		$Control/Interactables/Box.queue_free()
		give_item("res://scenes/underground/level_4/explosives.png", "Explosives")
	elif selected_item and selected_item.name == "Shovel" and cur_int.name == "Dirt":
		$Control/Interactables/Dirt.queue_free()
		$Control/Interactables/Detonator.show()
	elif selected_item and selected_item.name == "Explosives" and cur_int.name == "Door" and get_node_or_null("Control/Inventory/Scroll/Items/Detonator") != null:
		$Control/Interactables/Door.queue_free()
		$Destroyed.show()
		victory()
