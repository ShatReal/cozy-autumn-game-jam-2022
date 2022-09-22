extends Node2D
class_name Ground


signal change_scene(to, transition)

export var queue: Array

var current := -1


func _ready() -> void:
	if get_parent() == get_tree().get_root():
		advance()


func advance() -> void:
	current += 1
	if current >= queue.size():
		if "6" in filename:
			emit_signal("change_scene", "res://scenes/sky/title.tscn", Vector2.UP)
		else:
			emit_signal("change_scene", filename.replace("ground", "underground"), Vector2.DOWN)
		return
	if queue[current] is String:
		if $AnimationPlayer.has_animation(queue[current]):
			$AnimationPlayer.play(queue[current])
		else:
			advance()
	else:
		$Dialogue.show_dialogue(queue[current])


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	advance()


func _on_Dialogue_done() -> void:
	advance()
