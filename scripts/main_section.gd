extends HSplitContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_flashcard_manager() -> void:
	$FlashcardManager.show()
	$EditorManager.hide()
	$CardEditor.hide()
	$NewCardEditor.hide()
	
func show_editor_manager() -> void:
	$FlashcardManager.hide()
	$EditorManager.show()
	$CardEditor.hide()
	$NewCardEditor.hide()

func show_card_editor() -> void:
	$FlashcardManager.hide()
	$EditorManager.hide()
	$CardEditor.show()
	$NewCardEditor.hide()

func show_new_card_editor() -> void:
	$FlashcardManager.hide()
	$EditorManager.hide()
	$CardEditor.hide()
	$NewCardEditor.show()


func _on_selector_edit_menu_pressed(id: int) -> void:
	$CardEditor.current_flashcard_id = id
	$CardEditor.is_flashcard_new = true
	show_card_editor()


func _on_start_revision_button_pressed() -> void:
	show_flashcard_manager()
	$FlashcardManager.update_flashcard($FlashcardManager.get_new_card())
