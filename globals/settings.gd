extends Node


var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size
