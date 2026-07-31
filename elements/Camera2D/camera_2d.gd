extends Camera2D


# Called when the node enters the scene tree for the first time.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("CameraZoomIn"):
		camera_zoom_in()
	if event.is_action_pressed("CameraZoomOut"):
		camera_zoom_out()

func _process(delta: float) -> void:
	camera_WASD_movement(delta)
	

func camera_WASD_movement(delta: float) -> void:
	var moveAmount := Vector2.ZERO
	if Input.is_action_pressed("CameraMoveRight"):
		moveAmount.x += 10
	if Input.is_action_pressed("CameraMoveLeft"):
		moveAmount.x -= 10
	if Input.is_action_pressed("CameraMoveUp"):
		moveAmount.y -= 10
	if Input.is_action_pressed("CameraMoveDown"):
		moveAmount.y += 10
	moveAmount = moveAmount.normalized()
	position += moveAmount * delta * 700 

func camera_zoom_in() -> void:
	zoom.x += 0.1
	zoom.y += 0.1
	
func camera_zoom_out() -> void:
	zoom.x -= 0.1
	zoom.y -= 0.1
