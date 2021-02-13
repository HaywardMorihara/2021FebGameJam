extends Node

# TODOs
# - levels / level flow

# TO POLISH:
# - Menu
# - Worldbuild (mouse & cheese, corn maze, triwizard tournamenet)
# - Art
# - Debug pathfinding (consider replacing?)
# - level design
# - allow for multiple walkers, multiple destinations
# - Music

# - PUBLISH TO ALL PLATFORMS!

# Notes:
# A little documentation on instancing/scene/shared properties: https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/


var level_in_progress = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.connect("hud_start_level", self, "_start_level")
	$HUD.connect("hud_to_menu", self, "_to_menu")
	$HUD.connect("hud_retry_level", self, "_restart_level")
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	$Walker.connect("area_entered", self, "_on_Walker_area_entered")
	$HUD.level_loaded($Timer.wait_time)
	

func _unhandled_input(event: InputEvent) -> void:
	# TODO Remove ability to place/remove tiles once the level has started
	if event is InputEventScreenTouch and event.pressed:
		var cell_position : Vector2 = $Navigation2D/TileMap.world_to_map(event.position)
		if $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 0:
			$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 1)
		elif $Navigation2D/TileMap.get_cell(cell_position.x, cell_position.y) == 1:
			$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 0)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if level_in_progress:
		var time_left : float = $Timer.time_left
		$HUD.level_update(time_left)


func set_path() -> void:
	var new_path : PoolVector2Array = $Navigation2D.get_simple_path(
		$Walker.global_position,
		# Scales the mouse position from the window's coordinate system to the viewport's.
		$Destination.global_position / OS.window_size * get_viewport().size,
		false
	)
	if new_path.empty():
		_game_over("You must leave a path to the destination!")
		return
	$Walker.path = new_path
	# TODO Dynamically create this for debugging
#	$Line2D.points = new_path


func _game_over(text : String) -> void:
	$Walker.pause = true
	$Timer.paused = true
	$HUD.level_end(text)
	

# Signals

func _start_level():
	level_in_progress = true
	set_path()
	$Timer.start()
	

# TODO Get this working
func _to_menu():
	get_tree().change_scene("res://menu/MainMenu.tscn")


# TODO Get this working
func _restart_level():
	get_tree().reload_current_scene()


# TODO Get this working
func _on_Timer_timeout():
	$Walker.pause = true
	$HUD.level_end("You Win!")
	

# body_entered doesn't work because Destination is NOT a body (see how Mobs were not Areas)
# Not sure when to use which type?
func _on_Walker_area_entered(area):
	_game_over("LOSE")
