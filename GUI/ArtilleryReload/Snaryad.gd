extends TextureRect

var dragging := false #:= само определяет тип переменной, таким образом переменная не становится динамической
var offset := Vector2(0, 0)

signal PodachaSnaryada
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PodachaSnaryada.connect(PodaemSnaryad)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
	if position > Vector2(230, -100) and position < Vector2(276, 69):
		$Button.disabled = true
		position = Vector2(245, 63)
		await get_tree().create_timer(0.3).timeout
		for i in range(6):
			position -= Vector2(0, 20)
			await get_tree().create_timer(0.01).timeout
		$"../..".needShompol = true
		$"../..".needZaryad = true
		$"../..".start = false
		queue_free()
	
func PodaemSnaryad() -> void:
	for i in range(9):
		position -= Vector2(0, i**2)
		await get_tree().create_timer(0.03).timeout
	for i in range(8, -1, -1):
		position -= Vector2(0, i**2)
		await get_tree().create_timer(0.03).timeout
