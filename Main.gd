extends Node


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
	
		# TODO Find a real home for this
		set_path()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_path() -> void:
	var new_path : PoolVector2Array = $Navigation2D.get_simple_path(
		$AnimatedSprite.global_position,
		# Scales the mouse position from the window's coordinate system to the viewport's.
		$Sprite.global_position / OS.window_size * get_viewport().size
	)
	$AnimatedSprite.path = new_path
	$Line2D.points = new_path
