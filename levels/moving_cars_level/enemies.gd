extends Node
@onready var victory_screen := preload("res://GUI/VictoryScreen/victory_screen.tscn")
@onready var defeat_screen := preload("res://GUI/DefeatScreen/defeat_screen.tscn")


func _ready() -> void:
	event_bus.scoutingRequest.connect(scoutingDataProviding)
	event_bus.enemyNeutralized.connect(_onEnemyDestroyed)
	for i in range(0, get_child_count()):
		get_child(i).global_position = Vector2(randf_range(-1000, -10000), randf_range(-1000, -10000))
	
func scoutingDataProviding() -> void:
	if get_child(0).get_child(0).get_child(0):
		event_bus.scoutingDataShow.emit(get_child(0).get_child(0).get_child(0).global_position[0] , get_child(0).get_child(0).get_child(0).global_position[1], $"../userArtillery".global_position[0], $"../userArtillery".global_position[1], get_child(0).get_child(0).get_child(0).global_rotation)
	elif get_child(0):
		event_bus.scoutingDataShow.emit(get_child(0).global_position[0] , get_child(0).global_position[1], $"../userArtillery".global_position[0], $"../userArtillery".global_position[1], get_child(0).global_rotation)

func _onEnemyDestroyed() -> void:
	await get_tree().create_timer(0.01).timeout
	if get_child_count() == 0:
		get_parent().add_child(victory_screen.instantiate())
