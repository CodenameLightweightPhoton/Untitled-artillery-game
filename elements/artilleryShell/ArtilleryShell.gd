extends CharacterBody2D
@export var SPEED:int = 3240 #пусть это будет 810 метров в секунду я хз
@onready var explosion := preload("res://elements/explosionAfterArtilleryShot/boom_after_shot.tscn")
var direction: float
var spawnPosition: Vector2
var spawnRotation: float  #во все эти переменные записывают значение при вызове 
var elevation: float
var g:int = 980 # g - gravity(ускорение свободного падения) учите физику;)

func _ready() -> void:
	global_position = spawnPosition
	global_rotation = spawnRotation
	elevation = elevation*PI/180 #переводим в радианы
	if elevation == 0:
		$Timer.start(0.1)
	else:
		$Timer.start(2*SPEED*sin(elevation)/g)

func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(direction)
	move_and_slide()


func _on_timer_timeout() -> void:
	var instance := explosion.instantiate()
	add_child(instance)
	instance.visible = true
	$Sprite2D.visible = false
	SPEED = 0
	instance.global_position = global_position
	await get_tree().create_timer(0.875).timeout
	queue_free()
