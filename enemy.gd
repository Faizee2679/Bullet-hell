extends Node2D

@export var projectileOG:PackedScene
@export var explosionOG:PackedScene

var health = 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Timer").start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("ProgressBar").value = health
	


func _on_timer_timeout() -> void:
	for number in range(8):
		var angle = number * 360 / 8
		var clone = projectileOG.instantiate()
		clone.rotation = deg_to_rad(angle)
		add_child(clone)


func _on_area_entered(area: Area2D) -> void:
	health -= 1
	if health <= 0:
		var exclone = explosionOG.instantiate()
		exclone.global_position = global_position
		get_tree().current_scene.add_child(exclone)
		queue_free()
