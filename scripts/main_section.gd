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
	
func show_editor_manager() -> void:
	$FlashcardManager.hide()
	$EditorManager.show()
	$CardEditor.hide()

func show_card_editor(edit_no: int) -> void:
	$FlashcardManager.hide()
	$EditorManager.hide()
	$CardEditor.show()


func _on_selector_edit_menu_pressed(id: int) -> void:
	$CardEditor.current_flashcard_id = id
	$CardEditor.is_flashcard_new = true
	show_card_editor(id)
