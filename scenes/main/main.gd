extends Node


const TWEEN_TIME := 0.5

var current_scene: Node
var new_scene: Node


func _ready() -> void:
	current_scene = load("res://scenes/sky/title.tscn").instance()
	add_child(current_scene)
	current_scene.connect("change_scene", self, "change_scene")


func change_scene(to: String, transition: Vector2) -> void:
	new_scene = load(to).instance()
	add_child(new_scene)
	if transition == Vector2.DOWN: # Camera pans DOWN
		new_scene.position.y = 1080
		$Tween.interpolate_property(current_scene, "position:y", current_scene.position.y, -1080, TWEEN_TIME)
		$Tween.interpolate_property(new_scene, "position:y", new_scene.position.y, 0, TWEEN_TIME)
	else: # Camera pans UP
		new_scene.position.y = -1080
		$Tween.interpolate_property(current_scene, "position:y", current_scene.position.y, 1080, TWEEN_TIME)
		$Tween.interpolate_property(new_scene, "position:y", new_scene.position.y, 0, TWEEN_TIME)
	$Tween.start()


func _on_Tween_tween_all_completed() -> void:
	current_scene.free()
	current_scene = new_scene
	if new_scene.has_signal("change_scene"):
		new_scene.connect("change_scene", self, "change_scene")
	if new_scene is Ground or new_scene is Underground:
		new_scene.advance()
