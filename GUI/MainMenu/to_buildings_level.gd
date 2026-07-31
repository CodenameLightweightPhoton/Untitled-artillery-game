extends Button



func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/city_level/level_with_buildings.tscn")
