extends VBoxContainer

@onready var question_text_edit = $CardEditHBoxContainer/VBoxContainer/QuestionTextEdit
@onready var answer_text_edit = $CardEditHBoxContainer/VBoxContainer/AnswerTextEdit

@onready var error_label = $CardEditHBoxContainer/VBoxContainer/ErrorLabel
@onready var saved_label = $CardEditHBoxContainer/VBoxContainer/SavedLabel

func _on_add_new_card_button_pressed() -> void:
	if (question_text_edit.text != "" and
			 answer_text_edit.text != ""):
		Flashcards.add_flashcard(question_text_edit.text, answer_text_edit.text)
		error_label.hide()
		saved_label.show()
	else:
		error_label.show()
		saved_label.hide()


func _on_question_text_edit_text_changed() -> void:
	error_label.hide()
	saved_label.hide()


func _on_answer_text_edit_text_changed() -> void:
	error_label.hide()
	saved_label.hide()
