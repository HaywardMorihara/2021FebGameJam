extends Area2D


export var speed : = 400.0
var path : = PoolVector2Array() setget set_path
var pause = false

var time_elapsed : = 0.0
var level_time : float

func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	if pause:
		$AnimatedSprite.playing = false
	else:	
		time_elapsed += delta
		scale.y = (level_time - time_elapsed * 0.9) / level_time
		$AnimatedSprite.playing = true
		var move_distance : = speed * delta
		$AnimatedSprite.speed_scale = speed / 20
		_move_along_path(move_distance)
	

func _move_along_path(distance : float) -> void:
	var last_point : = position
	for index in range(path.size()):
		var distance_to_next = last_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			var next_position = last_point.linear_interpolate(path[0], distance / distance_to_next)
			if abs(next_position.x - position.x) > abs(next_position.y - position.y):
				if next_position.x > position.x:
					$AnimatedSprite.animation = "left"
					$AnimatedSprite.flip_h = true
				if next_position.x < position.x:
					$AnimatedSprite.animation = "left"
					$AnimatedSprite.flip_h = false
			else:
				if next_position.y > position.y:
					$AnimatedSprite.animation = "down"
				if next_position.y < position.y:
					$AnimatedSprite.animation = "up"
			position = next_position
			break
		elif path.size() == 1 and distance >= distance_to_next:
			position = path[0]
			set_process(false)
			break

		distance -= distance_to_next
		last_point = path[0]
		path.remove(0)


func set_path(value : PoolVector2Array) -> void:
	if value.size() == 0:
		return
	path = value
	path.remove(0)
	set_process(true)	

