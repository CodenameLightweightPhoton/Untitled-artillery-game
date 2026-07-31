extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_button_down() -> void:
	$"..".visible = false# Replace with function body.
	$"../../LevelSelectingPanel".visible = true
