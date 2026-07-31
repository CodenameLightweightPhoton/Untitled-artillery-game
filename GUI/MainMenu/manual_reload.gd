extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".button_pressed = event_bus.manual_reload

func _on_pressed() -> void:
	event_bus.manual_reload = !event_bus.manual_reload
