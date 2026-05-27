extends Area2D

var OGdirewction = Vector2(1, 0)

func _process(delta: float) -> void:
	var newDirection = OGdirewction.rotated(rotation)
	position += newDirection * 10


func _on_area_entered(area: Area2D) -> void:
	queue_free()
