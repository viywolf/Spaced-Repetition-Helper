extends HBoxContainer

signal edit_button_pressed

@export var displayed_text = ""
@export var flashcard_id: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ScrollContainer/Label.text = displayed_text


func _on_edit_button_pressed() -> void:
	edit_button_pressed.emit()
