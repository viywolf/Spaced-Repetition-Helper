extends VBoxContainer

var current_flashcard_set: String = "Demo Flashcard"
var current_flashcard: Array
var cur_question_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_new_card()
	update_flashcard(cur_question_index)


func update_flashcard(question_index: int):
	$ArrowContainer/IncorrectButton.hide()
	$ArrowContainer/CorrectButton.hide()
	# No flashcard
	if question_index == -1:
		%AnswerText.visible_characters = 0
		%TitleText.text = current_flashcard_set
		%QuestionText.text = "All flashcards complete!"
		%AnswerText.text = "You have completed all flashcards"
		return
	current_flashcard = Flashcards.flashcards[current_flashcard_set][question_index]
	
	%AnswerText.visible_characters = 0
	%TitleText.text = current_flashcard_set
	%QuestionText.text = current_flashcard[Flashcards.QUESTION]
	%AnswerText.text = current_flashcard[Flashcards.ANSWER]

func _on_reveal_button_pressed() -> void:
	%AnswerText.visible_characters = -1
	if cur_question_index != -1:
		$ArrowContainer/IncorrectButton.show()
		$ArrowContainer/CorrectButton.show()


func get_new_card() -> void:
	for i in range(Flashcards.flashcards[current_flashcard_set].size()):
		var card = Flashcards.flashcards[current_flashcard_set][i]
		if card[Flashcards.STAGE] == "0":
			current_flashcard = card
			cur_question_index = i
			return
	# If it reaches here no card was found
	cur_question_index = -1
	

func _on_correct_button_pressed() -> void:
	current_flashcard[Flashcards.STAGE] = str(int(current_flashcard[Flashcards.STAGE]) + 1)
	get_new_card()
	update_flashcard(cur_question_index)


func _on_incorrect_button_pressed() -> void:
	current_flashcard[Flashcards.STAGE] = "0"
	get_new_card()
	update_flashcard(cur_question_index)
