extends CanvasLayer

@onready var azimutLineEdit: LineEdit = $ArtillerySetValues/Panel/Azimut
@onready var elevationLineEdit: LineEdit = $ArtillerySetValues/Panel/Elevation
@onready var scoutingDataButton: Button = $ArtillerySetValues/Panel/ScoutingData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	azimutLineEdit.text_submitted.connect(_on_azimut_text_submitted)
	elevationLineEdit.text_submitted.connect(_on_elevation_text_submitted)
	event_bus.scoutingDataShow.connect(_on_scouting_data_received)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_azimut_text_submitted(azimut: String) -> void:
	event_bus.azimutChange.emit(int(azimut))
	azimutLineEdit.release_focus()
	azimutLineEdit.text = "ЗАДАНО"
	await get_tree().create_timer(1.0).timeout #waits 1 second
	azimutLineEdit.clear()

func _on_elevation_text_submitted(gunElevation: String) -> void:
	var elevation:int = int(gunElevation)
	if elevation < 0:
		elevation = 0
	if elevation > 68:
		elevation = 68
	event_bus.elevationChange.emit(elevation)
	elevationLineEdit.release_focus()
	elevationLineEdit.text = "ЗАДАНО"
	await get_tree().create_timer(1.0).timeout #waits 1 second
	elevationLineEdit.clear()

func _on_scouting_data_pressed() -> void:
	event_bus.scoutingRequest.emit()

func _on_scouting_data_received(enemy_position_x: int, enemy_position_y: int, artillery_position_x: int, artillery_position_y: int, enemy_azimut: int) -> void:
	$ScoutingDataPanel/DataShowLabel.text = "Координаты цели = %d, %d\nКоординаты артиллерийского расчёта = %d, %d\n Направление противника по азимуту: %d" % [enemy_position_x, enemy_position_y, artillery_position_x, artillery_position_y, enemy_azimut*90]
