extends HBoxContainer

@export var displayed_text = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ScrollContainer/Label.text = displayed_text
