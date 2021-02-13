extends Node

# TODO
# - Mae the walk actually move on the tiles instead of the lines between them
# - Main menu
# - Game/menu flow
# - levels
# - level flow

# TO POLISH:
# - Worldbuild
# - Art
# - Debug pathfinding (consider replacing?)
# - level design
# - Music

# - PUBLISH TO ALL PLATFORMS!


var level_in_progress = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$LevelEndLabel.hide()
	$ReturnToMenuButton.hide()
	$RetryLevelButton.hide()
	$TimerLabel.text = str($Timer.wait_time)
	

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
		$TimerLabel.text = str(time_left)


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
	$Line2D.points = new_path


func _on_Button_pressed():
	level_in_progress = true
	$StartButton.hide()
	set_path()
	$Timer.start()


func _on_Timer_timeout():
	$Walker.pause = true
	$LevelEndLabel.text = "You Win!"
	$LevelEndLabel.show()
	$ReturnToMenuButton.show()
	$RetryLevelButton.show()


func _on_ReturnToMenuButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_RetryLevelButton_pressed():
	get_tree().reload_current_scene()


# body_entered doesn't work because Destination is NOT a body (see how Mobs were not Areas)
# Not sure when to use which type?
func _on_Walker_area_entered(area):
	_game_over("LOSE")
	
	
func _game_over(text : String) -> void:
	$Walker.pause = true
	$Timer.paused = true
	$LevelEndLabel.text = text
	$LevelEndLabel.show()
	$ReturnToMenuButton.show()
	$RetryLevelButton.show()
