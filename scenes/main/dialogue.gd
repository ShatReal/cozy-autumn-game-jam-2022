extends Control


signal done

var lines: PoolStringArray
var current: int


func _ready() -> void:
	hide()
	set_process_input(false)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		get_tree().set_input_as_handled()
		if $Timer.is_stopped():
			advance()
		else:
			$Timer.stop()
			$PanelContainer/VBoxContainer/Speech.visible_characters = $PanelContainer/VBoxContainer/Speech.get_total_character_count()


func show_dialogue(l: PoolStringArray) -> void:
	set_process_input(true)
	$AnimationPlayer.play("open")
	lines = l
	current = -1
	advance()


func advance() -> void:
	current += 1
	if current >= lines.size():
		set_process_input(false)
		$AnimationPlayer.play("close")
		emit_signal("done")
		return
	var line := lines[current].split("|")
	$PanelContainer/VBoxContainer/Title.text = line[0]
	$PanelContainer/VBoxContainer/Speech.text = line[1]
	$PanelContainer/VBoxContainer/Speech.visible_characters = 0
	$Timer.start()


func _on_Timer_timeout() -> void:
	if $PanelContainer/VBoxContainer/Speech.visible_characters != $PanelContainer/VBoxContainer/Speech.get_total_character_count():
		$PanelContainer/VBoxContainer/Speech.visible_characters += 1
		$Timer.start()
