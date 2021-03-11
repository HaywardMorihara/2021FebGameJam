extends RichTextLabel

var is_temp_message = false


func display_temp_message(message : String) -> void:
	is_temp_message = true
	text = message
	show()
	$PlayerMessageTimer.start()
	
	
func clear_temp_message() -> void:
	if is_temp_message:
		is_temp_message = false
		hide()

func _on_PlayerMessageTimer_timeout():
	if is_temp_message:
		is_temp_message = false
		hide()


func _on_PlayerMessageLabel_gui_input(event):
	if event is InputEventScreenTouch and event.pressed: 
		clear_temp_message()
