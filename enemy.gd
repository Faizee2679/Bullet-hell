extends Node2D

@export var projectileOG:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Timer").start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var clone = projectileOG.instantiate()
	add_child(clone)
