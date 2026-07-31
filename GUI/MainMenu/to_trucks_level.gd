extends Button

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/moving_cars_level/level_with_moving_trucks.tscn")
