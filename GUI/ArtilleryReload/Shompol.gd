extends Panel

var dragging := false
var offset := Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - offset
		if position.x > 170 and position.x < 280 and position.y < 90 and $"../..".needShompol:
			$"../..".needShompol = false


func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false
	if position.y < -120:
		position = Vector2(44, 177)
	if !$"../..".needZaryad and !$"../..".needShompol and !$"../..".start:
		$"../..".reloadEnded.emit()
	if $"../..".needZaryad and !$"../..".needShompol and position < Vector2(120, 260) and position > Vector2(0, 120):
		$"../Zaryad".Podacha.emit()
