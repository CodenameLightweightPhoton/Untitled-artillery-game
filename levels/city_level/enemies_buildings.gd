extends Node
@onready var victory_screen := preload("res://GUI/VictoryScreen/victory_screen.tscn")
@onready var defeat_screen := preload("res://GUI/DefeatScreen/defeat_screen.tscn")

func _ready() -> void:
	event_bus.scoutingRequest.connect(_scoutingDataProviding)
	event_bus.enemyNeutralized.connect(_onEnemyDestroyed)
	
func _scoutingDataProviding() -> void:
	$"../ATTACKTHEDPOINT".play()
	if get_child(0):
		event_bus.scoutingDataShow.emit(get_child(0).global_position.x, get_child(0).global_position.y, $"../userArtillery".global_position.x, $"../userArtillery".global_position.y, get_child(0).rotation/PI*180)

func _onEnemyDestroyed() -> void:
	await get_tree().create_timer(0.01).timeout
	if get_child_count() == 0:
		get_parent().add_child(victory_screen.instantiate())


func _on_defeating_timer_timeout() -> void:
	get_parent().add_child(defeat_screen.instantiate())
