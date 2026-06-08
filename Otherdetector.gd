extends Area2D

@onready var progress_bar: ProgressBar = $"../ProgressBar"

func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	print("entered?")
	if progress_bar.value <= 0:
		var objectsNear = get_overlapping_areas()
		print(objectsNear)
		for number in range(len(objectsNear)):
			objectsNear[number].health -= 1
			print("health affected")
