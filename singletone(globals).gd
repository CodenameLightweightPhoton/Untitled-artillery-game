extends Node
var manual_reload: bool = true
var cityName: String = "Мухосранск"

signal elevationChange(new_elevation: int)
signal azimutChange(azimut: int)
signal scoutingRequest
signal scoutingDataShow(enemy_position_x: int, enemy_position_y: int, artillery_position_x: int, artillery_position_y: int, enemy_azimut: int)
signal enemyNeutralized()
