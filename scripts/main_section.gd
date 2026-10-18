extends HSplitContainer

func show_flashcard_manager() -> void:
	$FlashcardManager.show()
	$EditorManager.hide()
	$CardEditor.hide()
	$NewCardEditor.hide()
	$WelcomeScreen.hide()
	
func show_editor_manager() -> void:
	$FlashcardManager.hide()
	$EditorManager.show()
	$CardEditor.hide()
	$NewCardEditor.hide()
	$WelcomeScreen.hide()

func show_card_editor() -> void:
	$FlashcardManager.hide()
	$EditorManager.hide()
	$CardEditor.show()
	$NewCardEditor.hide()
	$WelcomeScreen.hide()

func show_new_card_editor() -> void:
	$FlashcardManager.hide()
	$EditorManager.hide()
	$CardEditor.hide()
	$NewCardEditor.show()
	$WelcomeScreen.hide()


func _on_selector_edit_menu_pressed(id: int) -> void:
	$CardEditor.current_flashcard_id = id
	$CardEditor.is_flashcard_new = true
	show_card_editor()


func _on_start_revision_button_pressed() -> void:
	show_flashcard_manager()
	$FlashcardManager.update_flashcard($FlashcardManager.get_new_card())
	$Management/Control/Label.text = "Day: " + str(int(Settings.cur_time))


func _on_new_card_editor_new_flashcard_made() -> void:
	$Management/Control/ScrollContainer/Selector.add_flashcards()
	update_need_to_revise_label()


func _on_add_new_card_button_pressed() -> void:
	show_new_card_editor()


func _on_advance_time_button_pressed() -> void:
	Settings.cur_time += 1
	Flashcards.advance_time()
	update_need_to_revise_label()


func _on_card_editor_flashcard_updated() -> void:
	$Management/Control/ScrollContainer/Selector.add_flashcards()


func update_need_to_revise_label() -> void:
	$Management/Control/Label.text = "Day: " + str(int(Settings.cur_time))
	if Flashcards.does_flashcard_need_revision():
		$Management/Control/Label.text = $Management/Control/Label.text + " | Revise now!"
