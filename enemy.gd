extends Node2D

@export var projectileOG:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Timer").start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	for number in range(8):
		var angle = number * 360 / 8
		var clone = projectileOG.instantiate()
		clone.rotation = deg_to_rad(angle)
		add_child(clone)
