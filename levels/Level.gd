extends Node


export var number_of_blocks : int = 0
export var start_level_message : String = ""

var level_in_progress = false
var input_placing_blocks = false
var input_removing_blocks = false

# TODO should be using a position node instead of walker on the map
var walker_start_position : Vector2
var walker_start_cell_position : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.show()
	$HUD.connect("hud_start_level", self, "_start_level")
	$HUD.connect("hud_to_menu", self, "_to_menu")
	$HUD.connect("hud_retry_level", self, "_restart_level")
	$HUD.connect("hud_next_level", self, "_next_level")
	$HUD.connect("hud_to_credits", self, "_to_credits")
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	$Walker.connect("area_entered", self, "_on_Walker_area_entered")
	$Walker.level_time = $Timer.wait_time
	walker_start_position = $Walker.position
	walker_start_cell_position = $Navigation2D/TileMap.world_to_map(walker_start_position)
	var start_position = $Navigation2D/TileMap.map_to_world(walker_start_cell_position)
	$HUD.level_loaded(_determine_current_level(), $Timer.wait_time, number_of_blocks, start_position)
	if !start_level_message.empty():
		$HUD.temp_message(start_level_message)
	if not LevelMusic.playing:
		LevelMusic.play()
	
	
# TODO Combine this into the normal level start method
func _restart_level() -> void:
	level_in_progress = false
	$Walker.reset(walker_start_position)
	$Timer.start()
	$Timer.paused = true
	var start_position = $Navigation2D/TileMap.map_to_world($Navigation2D/TileMap.world_to_map($Walker.position))
	$HUD.level_loaded(_determine_current_level(), $Timer.wait_time, number_of_blocks, start_position)
	if !start_level_message.empty():
		$HUD.temp_message(start_level_message)
	

func _unhandled_input(event: InputEvent) -> void:
	var cell_position : Vector2 = $Navigation2D/TileMap.world_to_map(event.position)
	if cell_position != walker_start_cell_position && not _is_on_dest_position(cell_position):
		if event is InputEventScreenTouch and !event.pressed and !level_in_progress:
			input_placing_blocks = false
			input_removing_blocks = false
		if event is InputEventScreenTouch and event.pressed and !level_in_progress:
			if $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 0:
				input_placing_blocks = true
				_place_block(cell_position)
			elif $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 1:
				_remove_block(cell_position)
				input_removing_blocks = true
		if event is InputEventScreenDrag && !level_in_progress:
			if input_placing_blocks:
				if $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 0:
					_place_block(cell_position)
			if input_removing_blocks:
				if $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 1:
					_remove_block(cell_position)
		

func _place_block(cell_position : Vector2) -> void:
	if number_of_blocks <=0:
		$HUD.temp_message("No more blocks to place!")
		return
	$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 1)
	number_of_blocks -= 1
	$HUD.update_number_of_blocks(number_of_blocks)
	$BlockPlacementSound.play()
		
		
func _remove_block(cell_position : Vector2) -> void:
	$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 0)
	number_of_blocks += 1
	$HUD.update_number_of_blocks(number_of_blocks)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if level_in_progress:
		var time_left : float = $Timer.time_left
		$HUD.level_update(time_left)


func _set_path() -> bool:
	var new_path = _find_shortest_path()
	if new_path.empty():
		_game_over("You must leave a path to all destinations!")
		return false
	$Walker.path = new_path
	$Walker.pause = false
	$Timer.paused = false
	return true
#	_create_line(new_path)


func _game_over(text : String) -> void:
	$Walker.pause = true
	$Timer.paused = true
	$HUD.level_end(text, false, _is_next_level())
	

# Signals

func _start_level():
	if !_set_path():
		return
	level_in_progress = true
	$Timer.start()
	

func _to_menu():
	get_tree().change_scene("res://menus/MainMenu.tscn")
	
	
func _to_credits():
	get_tree().change_scene("res://menus/CreditsMenu.tscn")


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
	var next_level_number = _determine_current_level() + 1
	var next_level_filename : String
	if next_level_number < 10:
		next_level_filename = "res://levels/Level0%d.tscn" % next_level_number
	else:
		next_level_filename = "res://levels/Level%d.tscn" % next_level_number
	return next_level_filename


func _determine_current_level() -> float:
	var current_scene_name : String = get_tree().get_current_scene().filename
	var current_level_number = current_scene_name.split("Level")[1].split(".tscn")[0]
	return float(current_level_number)


func _on_Timer_timeout():
	if level_in_progress:
		level_in_progress = false
		$Walker.pause = true
		$HUD.level_update(0.0)
		$HUD.level_end("   You Win!", true, _is_next_level())
	

# body_entered doesn't work because Destination is NOT a body (see how Mobs were not Areas)
# Not sure when to use which type?
func _on_Walker_area_entered(area):
	if level_in_progress:
		level_in_progress = false
		_game_over("You Lose :(")


# TODO Turn off when actually releasing the game
func _create_line(new_path : PoolVector2Array) -> void:
	var line = Line2D.new()
	line.points = new_path
	add_child(line)


func _is_on_dest_position(cell_position : Vector2):
	for dest in get_tree().get_nodes_in_group("destinations"):
		var dest_cell_position = $Navigation2D/TileMap.world_to_map(dest.position)
		if cell_position == dest_cell_position:
			return true
	return false


func _find_shortest_path():
	var shortest_path : PoolVector2Array
	var shortest_path_len : float
	for dest in get_tree().get_nodes_in_group("destinations"):
		var new_path : PoolVector2Array = $Navigation2D.get_simple_path(
			$Walker.global_position,
			dest.global_position,
			false
		)
		if new_path.empty():
			return new_path
		var new_path_len = _calc_total_distance(new_path)
		if shortest_path.empty() or shortest_path_len > new_path_len:
			shortest_path = new_path 
			shortest_path_len = new_path_len
	return shortest_path


func _calc_total_distance(path : PoolVector2Array) -> float:
	var total_distance : float = 0.0
	for i in range(path.size()-1):
		total_distance += path[i].distance_to(path[i+1])
	return total_distance
