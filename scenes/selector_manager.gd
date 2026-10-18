extends VBoxContainer

signal edit_menu_pressed(id: int)

@onready var flashcard_select = preload("res://scenes/flashcard_selector.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_flashcards()
	#create_set_label("Hello world")


func create_section_label(message: String) -> void:
	var section_label := RichTextLabel.new()
	section_label.text = message
	add_child(section_label)
	
func create_flashcard_select(label_text: String, id: int) -> void:
	var new_flashcard_select = flashcard_select.instantiate()
	new_flashcard_select.displayed_text = label_text
	new_flashcard_select.flashcard_id = id
	new_flashcard_select.edit_button_pressed.connect(open_edit_menu.bind(new_flashcard_select.flashcard_id))
	self.add_child(new_flashcard_select)

func add_flashcards() -> void:
	for key in Flashcards.flashcards:
		for flashcard: Array in Flashcards.flashcards[key]:
			create_flashcard_select(flashcard[Flashcards.QUESTION], int(flashcard[Flashcards.ID]))

func open_edit_menu(id: int):
	print(id)
	edit_menu_pressed.emit(id)
