extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var explosions = [
		"explosion 1",
		"explosion 2"
	]
	var chosen = randi_range(0, 1)
	get_node("AnimatedSprite2D").animation = explosions[chosen]
	get_node("AnimatedSprite2D").play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	print("finished")
	queue_free()
