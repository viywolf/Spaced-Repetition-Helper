extends VBoxContainer

@onready var flashcard_select = preload("res://scenes/flashcard_selector.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#create_set_label("Hello world")


func create_section_label(message: String) -> void:
	var section_label := RichTextLabel.new()
	section_label.text = message
	add_child(section_label)
	
func create_set_label(label_text: String) -> void:
	var new_flashcard_select = flashcard_select.instantiate()
	new_flashcard_select.displayed_text = label_text	
	self.add_child(new_flashcard_select)
