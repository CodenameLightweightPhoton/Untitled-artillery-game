extends LineEdit

func _on_text_submitted(new_text: String) -> void:
	event_bus.cityName = new_text
	$".".release_focus()
