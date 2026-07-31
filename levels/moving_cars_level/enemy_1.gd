extends Path2D
var speed: int = 5 #meters per second

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PathFollow2D.progress_ratio += delta * speed / 100
