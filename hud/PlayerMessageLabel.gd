extends Label


func display_temp_message(message : String) -> void:
	text = message
	show()
	$PlayerMessageTimer.start()
	

func _on_PlayerMessageTimer_timeout():
	hide()
