extends MarginContainer


func _on_StartGameButton_pressed():
	get_tree().change_scene("res://levels/Level1.tscn")


func _on_LevelSelectButton_pressed():
	get_tree().change_scene("res://menus/LevelMenu.tscn")
