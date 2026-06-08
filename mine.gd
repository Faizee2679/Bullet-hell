extends Area2D

@onready var progressBar:ProgressBar = get_node("ProgressBar")

@export var explosionOG:PackedScene

func _ready() -> void:
	progressBar.value = 100
	
func _on_area_entered(area: Area2D) -> void:
	progressBar.value -= 1
	if progressBar.value <= 0:
		var exclone = explosionOG.instantiate()
		exclone.global_position = global_position
		get_tree().current_scene.add_child(exclone)
		queue_free()
