extends Control


signal hud_start_level
signal hud_to_menu
signal hud_retry_level

func level_loaded(level_time : float) -> void:
	$LevelEndLabel.hide()
	$ReturnToMenuButton.hide()
	$RetryLevelButton.hide()
	$TimerLabel.text = str(level_time)
	$StartButton.show()
	
	
func level_update(time_left : float) -> void:
	$TimerLabel.text = str(time_left)


func level_end(message : String) -> void:
	$LevelEndLabel.text = message
	$LevelEndLabel.show()
	$ReturnToMenuButton.show()
	$RetryLevelButton.show()
	
	

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("hud_start_level")


func _on_ReturnToMenuButton_pressed():
	emit_signal("hud_to_menu")


func _on_RetryLevelButton_pressed():
	emit_signal("hud_retry_level")
