extends Node2D

@onready var progress_bar = $ProgressBar
var direction = true

func _ready():
	progress_bar.value = 0
	get_node("Timer").start()

func _process(_delta):
	pass
			

func _on_timer_timeout() -> void:
	if progress_bar.value != 5 and direction == true:
		progress_bar.value += 1
	elif progress_bar.value >0 and direction == false:
		progress_bar.value -= 1
