extends VBoxContainer


var level_button_scene = preload("res://menus/elements/LevelButton.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var level_scenes = _find_level_scenes()
	level_scenes.sort()
	print(level_scenes)
	for level_scene in level_scenes:
		var level_button_scene_instance = level_button_scene.instance()
		level_button_scene_instance.text = level_scene
		level_button_scene_instance.rect_min_size.y = 50
		level_button_scene_instance.connect("pressed", self, "_on_Level_Button_pressed", [level_scene])
		add_child(level_button_scene_instance)
	

func _find_level_scenes() -> Array:
	var level_scenes : Array = []
	var dir = Directory.new()
	if dir.open("res://levels/") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if ! dir.current_is_dir() && file_name.ends_with(".tscn"):
				level_scenes.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		return []
	return level_scenes
	

func _on_Level_Button_pressed(level : String) -> void:
	var level_path = "res://levels/%s" % [level]
	print(level_path)
	get_tree().change_scene(level_path)
