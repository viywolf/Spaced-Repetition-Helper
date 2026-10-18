extends Node

var cur_time: float = 0

var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size
