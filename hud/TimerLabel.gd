extends Label


func set_time(time : float) -> void:
	var rounded_time = stepify(time, 0.01)
	text = "Delay %.2fs" % rounded_time
	
