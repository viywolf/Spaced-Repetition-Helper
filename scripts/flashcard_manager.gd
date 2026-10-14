extends VBoxContainer

var current_flashcard_set: String = "Demo Flashcard"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_flashcard(0)


func update_flashcard(question_index: int):
	%AnswerText.visible_characters = 0
	%TitleText.text = current_flashcard_set
	%QuestionText.text = Flashcards.demo_flashcards[current_flashcard_set][question_index][Flashcards.QUESTION]
	%AnswerText.text = Flashcards.demo_flashcards[current_flashcard_set][question_index][Flashcards.ANSWER]



func _on_reveal_button_pressed() -> void:
	%AnswerText.visible_characters = -1
