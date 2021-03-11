extends Control


signal hud_start_level
signal hud_to_menu
signal hud_retry_level
signal hud_next_level
	

func level_loaded(level_number : float, level_time : float, number_of_blocks : float, start_position : Vector2) -> void:
	$TitleLabel.text = "Level %d" % level_number
	$PlayerMessageLabel.hide()
	$ReturnToMenuButton.hide()
	$RetryLevelButton.hide()
	$NextLevelButton.hide()
	$LevelTimerLabel.set_time(level_time)
	$StartButton.rect_position = start_position
	$StartButton.show()
	$NumberOfBlocksLabel.set_number_of_blocks(number_of_blocks)
	$NumberOfBlocksLabel.show()
	
	
func level_update(time_left : float) -> void:
	$LevelTimerLabel.set_time(time_left)
	
	
func update_number_of_blocks(number_of_blocks : float) -> void:
	$NumberOfBlocksLabel.set_number_of_blocks(number_of_blocks)


func level_end(message : String, win : bool, is_next_level : bool) -> void:
	$PlayerMessageLabel.text = message
	$PlayerMessageLabel.show()
	$ReturnToMenuButton.show()
	if !win:
		$RetryLevelButton.show()
	if win && is_next_level:
		$NextLevelButton.show()
	

func temp_message(message : String) -> void:
	$PlayerMessageLabel.display_temp_message(message)
	

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("hud_start_level")


func _on_ReturnToMenuButton_pressed():
	emit_signal("hud_to_menu")


func _on_RetryLevelButton_pressed():
	emit_signal("hud_retry_level")


func _on_NextLevelButton_pressed():
	emit_signal("hud_next_level")
