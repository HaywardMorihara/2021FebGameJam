extends Control

func _ready() -> void:
	if LevelMusic.playing:
		LevelMusic.stop()

func _on_StartGameButton_pressed():
	get_tree().change_scene("res://levels/Level01.tscn")


func _on_LevelSelectButton_pressed():
	get_tree().change_scene("res://menus/LevelMenu.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://menus/CreditsMenu.tscn")
