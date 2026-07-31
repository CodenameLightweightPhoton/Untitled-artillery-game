extends Node2D

var canShoot: bool = true #заряжен ли снаряд для стрельбы
@export var elevation: int = 0
@onready var shell := preload("res://elements/artilleryShell/artillery_shell.tscn")
@onready var reloadGUI := preload("res://GUI/ArtilleryReload/ArtilleryReload.tscn")


func _ready() -> void:
	event_bus.elevationChange.connect(_elevationChange)
	event_bus.azimutChange.connect(_azimutChange)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		if canShoot == true:
			shoot()

func shoot() -> void:
	if canShoot == true:
		canShoot = false
		$ChassiSprite/TurretSprite/Kazennik/Cannon/CannonFlash.play("default", 1, false)
		var instance := shell.instantiate()
		instance.direction = $ChassiSprite/TurretSprite.rotation
		instance.spawnPosition = $ChassiSprite/TurretSprite/Kazennik/Cannon.global_position
		instance.spawnRotation = $ChassiSprite/TurretSprite.rotation
		instance.elevation = elevation
		add_child(instance)
		for i in range(3):
			$ChassiSprite/TurretSprite/Kazennik/Cannon.position += Vector2(0, 10)
			position += Vector2(0, 2)
			await get_tree().create_timer(0.01).timeout
		for i in range(15):
			$ChassiSprite/TurretSprite/Kazennik/Cannon.position -= Vector2(0, 2)
			position -= Vector2(0, 0.4)
			await get_tree().create_timer(0.01).timeout
		if event_bus.manual_reload == true: #$MarginContainer/SettingsPanel/ManualReload
			add_child(reloadGUI.instantiate())
		else:
			await get_tree().create_timer(5).timeout
			canShoot = true

func _elevationChange(new_elevation: int) -> void:
	elevation = new_elevation

func _azimutChange(new_rotation: int) -> void:
	$ChassiSprite/TurretSprite.rotation = int(new_rotation)*PI/180
