extends Node2D

var minion = preload("res://enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for number in range(6):
		var clone = minion.instantiate()
		clone.position = Vector2(randi_range(-100, 100), randi_range(0, 200))
		add_child(clone)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
