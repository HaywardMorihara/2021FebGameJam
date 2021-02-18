extends Node


export var number_of_blocks = 0


var level_in_progress = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.connect("hud_start_level", self, "_start_level")
	$HUD.connect("hud_to_menu", self, "_to_menu")
	$HUD.connect("hud_retry_level", self, "_restart_level")
	$HUD.connect("hud_next_level", self, "_next_level")
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	$Walker.connect("area_entered", self, "_on_Walker_area_entered")
	$HUD.level_loaded($Timer.wait_time, number_of_blocks)
	

func _unhandled_input(event: InputEvent) -> void:
	# TODO Remove ability to place/remove tiles once the level has started
	if event is InputEventScreenTouch and event.pressed and !level_in_progress:
		var cell_position : Vector2 = $Navigation2D/TileMap.world_to_map(event.position)
		if $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 0:
			if number_of_blocks > 0:
				$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 1)
				number_of_blocks -= 1
				$HUD.update_number_of_blocks(number_of_blocks)
		elif $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 1:
			$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 0)
			number_of_blocks += 1
			$HUD.update_number_of_blocks(number_of_blocks)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if level_in_progress:
		var time_left : float = $Timer.time_left
		$HUD.level_update(time_left)


func set_path() -> void:
	var new_path : PoolVector2Array = $Navigation2D.get_simple_path(
		$Walker.global_position,
		$Destination.global_position,
		false
	)
	if new_path.empty():
		_game_over("You must leave a path to the destination!")
		return
	$Walker.path = new_path
	_create_line(new_path)


func _game_over(text : String) -> void:
	$Walker.pause = true
	$Timer.paused = true
	$HUD.level_end(text, false, _is_next_level())
	

# Signals

func _start_level():
	level_in_progress = true
	set_path()
	$Timer.start()
	

func _to_menu():
	get_tree().change_scene("res://menus/MainMenu.tscn")


func _restart_level():
	get_tree().reload_current_scene()


func _next_level():
	if _is_next_level():
		get_tree().change_scene(_determine_next_level())
	
	
func _is_next_level() -> bool:
	var next_level_filename = _estimate_next_level_filename()
	var file = File.new()
	return file.file_exists(next_level_filename)

	
func _determine_next_level() -> String:
	var next_level_filename = _estimate_next_level_filename()
	var file = File.new()
	if file.file_exists(next_level_filename):
		return next_level_filename
	else:
		return "null"


func _estimate_next_level_filename() -> String:
	var current_scene_name : String = get_tree().get_current_scene().filename
	var current_level_number = current_scene_name.split("Level")[1].split(".tscn")[0]
	var next_level_number = float(current_level_number) + 1
	var next_level_filename = "res://levels/Level%d.tscn" % next_level_number
	return next_level_filename


func _on_Timer_timeout():
	$Walker.pause = true
	$HUD.level_end("You Win!", true, _is_next_level())
	

# body_entered doesn't work because Destination is NOT a body (see how Mobs were not Areas)
# Not sure when to use which type?
func _on_Walker_area_entered(area):
	_game_over("LOSE")


# TODO Turn off when actually releasing the game
func _create_line(new_path : PoolVector2Array) -> void:
	var line = Line2D.new()
	line.points = new_path
	add_child(line)
