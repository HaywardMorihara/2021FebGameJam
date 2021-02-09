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
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		var cell_position : Vector2 = $Navigation2D/TileMap.world_to_map(event.position)
		$Navigation2D/TileMap.set_cell(cell_position.x, cell_position.y, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_left : float = $Timer.time_left
	$Label.text = str(time_left)


func set_path() -> void:
	var new_path : PoolVector2Array = $Navigation2D.get_simple_path(
		$AnimatedSprite.global_position,
		# Scales the mouse position from the window's coordinate system to the viewport's.
		$Sprite.global_position / OS.window_size * get_viewport().size
	)
	$AnimatedSprite.path = new_path
	$Line2D.points = new_path


func _on_Button_pressed():
	$Button.hide()
	set_path()
	$Timer.start()
