extends Button


# Called when the node enters the scene tree for the first time.


func _on_pressed() -> void:
	$"..".visible = false	#makes SettingsPanel invisible
	$"../../MainMenuPanel".visible = true
