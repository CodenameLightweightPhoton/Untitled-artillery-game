extends MarginContainer
var needShompol: bool = false
var needZaryad:bool = false
var start:bool = true #чтобы игрок в начале перезарядки не кликал на шомпол дабы перезарядка завершилась из-за бага

signal reloadEnded

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reloadEnded.connect(afterReload) #привязываем функцию которая выполнится при подаче сигнала
	appearance()
	$ReloadingWorkspace/Snaryad.PodachaSnaryada.emit() #посылает сигнал подачи снаряда

func afterReload() -> void:
	dissapearance()
	$"../..".canShoot = true
	await get_tree().create_timer(0.3).timeout
	queue_free()

func appearance() -> void:
	for i in range(9):
		position -= Vector2(0, i**2*scale.y)
		await get_tree().create_timer(0.01).timeout
	for i in range(9, -1, -1):
		position -= Vector2(0, i**2*scale.y)
		await get_tree().create_timer(0.01).timeout

func dissapearance() -> void:
	for i in range(9):
		position += Vector2(0, i**2*scale.y)
		await get_tree().create_timer(0.01).timeout
	for i in range(9, -1, -1):
		position += Vector2(0, i**2*scale.y)
		await get_tree().create_timer(0.01).timeout
