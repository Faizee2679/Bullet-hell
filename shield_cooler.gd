extends Node2D

@onready var timer = $Timer
@onready var progress_bar = $ProgressBar

func _ready():
	timer.start() 

func _process(_delta):
	if timer.time_left > 0:
		progress_bar.value = timer.time_left
		print("Timer Left: ", timer.time_left, " | Bar Value: ", progress_bar.value)
	else:
		progress_bar.value = timer.wait_time


func _on_timer_timeout() -> void:
	timer.stop()
