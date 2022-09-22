extends Underground


func _ready() -> void:
	interactions = {
		"Shovel": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Shovel and window won't work."]),
			},
			"Dirt": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's dig!"]),
			},
			"Key": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't reach the key with the shovel."]),
			},
			"Closed": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The shovel can't open the door."]),
			},
			"Open": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to store the shovel in there."]),
			},
			"Ladder": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The shovel and ladder don't go together."]),
			},
			"NoBars": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't climb on the shovel."]),
			},
			"Sleep": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't want to whack the hamster with the shovel!"]),
			},
			"Food": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't reach the food with the shovel."]),
			},
			"Rope": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to tie the shovel to anything."]),
			},
		},
		"Harpoon": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I could shoot a harpoon out the window but it could hit someone."]),
			},
			"Key": {
				"pickup": true,
				"dialogue": PoolStringArray(["Player|I can reach the key with the gun."]),
			},
			"Closed": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't open the door with this harpoon."]),
			},
			"Open": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to store the gun in there."]),
			},
			"Ladder": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The gun and ladder don't go together."]),
			},
			"NoBars": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't ride the harpoon gun up."]),
			},
			"Sleep": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't want to spear the hamster!"]),
			},
			"Food": {
				"pickup": true,
				"dialogue": PoolStringArray(["Player|Pew pew!"]),
			},
			"Rope": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The harpoon gun already comes with a rope."]),
			},
		},
		"Key": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The window has no lock."]),
			},
			"Closed": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's open the door."]),
			},
			"Open": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|It's already unlocked."]),
			},
			"Ladder": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The ladder doesn't need unlocking."]),
			},
			"NoBars": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The key doesn't work here."]),
			},
			"Sleep": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The hamster has no lock."]),
			},
			"Food": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't unlock the food or reach it with the key."]),
			},
			"Rope": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|These items don't work together."]),
			},
		},
		"Ladder": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can climb up but I can't escape with the bars on the window."]),
			},
			"Open": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No need to put it back."]),
			},
			"NoBars": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's get out! Climby climb!"]),
			},
			"Sleep": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I'm not sure what you expect me to do here."]),
			},
			"Food": {
				"pickup": true,
				"dialogue": PoolStringArray(["Player|Let's get it!"]),
			},
			"Rope": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to tie the ladder to anything."]),
			},
		},
		"Food": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The window doesn't need to be fed."]),
			},
			"Closed": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't open the door with food."]),
			},
			"Open": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No need to store the food."]),
			},
			"Ladder": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The ladder doesn't need food."]),
			},
			"NoBars": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|No need to throw food out the window."]),
			},
			"Sleep": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's feed the hamster!"]),
			},
			"Key": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't reach the key with the food."]),
			},
			"Rope": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to tie up the food."]),
			},
		},
		"Rope": {
			"Window": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|Let's tie the rope to the window."]),
			},
			"Dirt": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't think burying the rope will help here."]),
			},
			"Key": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The rope is too limp to throw."]),
			},
			"Closed": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't open the door with rope."]),
			},
			"Open": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to store the rope in there."]),
			},
			"Ladder": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The rope and ladder don't go together."]),
			},
			"NoBars": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|The rope will just fall back down if I throw it."]),
			},
			"Sleep": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't want to tie up the hamster."]),
			},
			"Food": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I can't reach the food with the rope."]),
			},
			"Shovel": {
				"pickup": false,
				"dialogue": PoolStringArray(["Player|I don't need to tie the shovel to anything."]),
			},
		},
	}


func check_interaction() -> void:
	if selected_item and selected_item.name == "Shovel" and cur_int.name == "Dirt":
		$Control/Interactables/Dirt.queue_free()
		give_item("res://scenes/underground/level_5/harpoon_gun.png", "Harpoon")
	elif selected_item and selected_item.name == "Key" and cur_int.name == "Closed":
		$Control/Interactables/Closed.queue_free()
		$Control/Interactables/Open.show()
		$Control/Interactables/Ladder.show()
	elif selected_item and selected_item.name == "Rope" and cur_int.name == "Window":
		selected_item.queue_free()
		$RopeToBars.show()
		if $HamAwake.visible:
			yield(get_tree().create_timer(1.0), "timeout")
			$RopeToBars.queue_free()
			$Control/Interactables/Window.queue_free()
			$Control/Interactables/NoBars.show()
	elif selected_item and selected_item.name == "Food" and cur_int.name == "Sleep":
		$Control/Interactables/Sleep.queue_free()
		$HamAwake.show()
		if $RopeToBars.visible:
			yield(get_tree().create_timer(1.0), "timeout")
			$RopeToBars.queue_free()
			$Control/Interactables/Window.queue_free()
			$Control/Interactables/NoBars.show()
	elif selected_item and selected_item.name == "Ladder" and cur_int.name == "NoBars" and $Control/Interactables/NoBars.visible:
		$Ladder.show()
		victory()
