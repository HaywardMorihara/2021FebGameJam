extends Node

# TODO
# - Win conddition
# - Lose condition
# - Ability to remove tiles
# - Main menu
# - Game/menu flow
# - level flow
# - Handle when no possible path

# TO POLISH:
# - Worldbuild
# - Art
# - Debug pathfinding (consider replacing?)
# - level design
# - Music

# - PUBLISH TO ALL PLATFORMS!

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$LevelEndLabel.hide()
	$TimerLabel.hide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		var cell_position : Vector2 = $Navigation2D/TileMap.world_to_map(event.position)
		$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_left : float = $Timer.time_left
	$TimerLabel.text = str(time_left)


func set_path() -> void:
	var new_path : PoolVector2Array = $Navigation2D.get_simple_path(
		$Walker.global_position,
		# Scales the mouse position from the window's coordinate system to the viewport's.
		$Destination.global_position / OS.window_size * get_viewport().size
	)
	$Walker.path = new_path
	$Line2D.points = new_path


func _on_Button_pressed():
	$Button.hide()
	$TimerLabel.show()
	set_path()
	$Timer.start()


func _on_Timer_timeout():
	# TODO Actual win conditions
	$LevelEndLabel.text = "You Win!"
	$LevelEndLabel.show()
