extends VBoxContainer

@export var current_flashcard_id: int
var is_flashcard_new: bool = false
var currrent_flashcard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_flashcard_new:
		update_info()
		is_flashcard_new = false

func update_info() -> void:
	currrent_flashcard = Flashcards.flashcards["Demo Flashcard"][current_flashcard_id]
	$CardEditTitle.text = "Editing flashcard " + str(current_flashcard_id)
	$CardEditHBoxContainer/VBoxContainer/QuestionTextEdit.text = currrent_flashcard[Flashcards.QUESTION]
	$CardEditHBoxContainer/VBoxContainer/AnswerTextEdit.text = currrent_flashcard[Flashcards.ANSWER]
	$CardEditHBoxContainer/VBoxContainer/Label.text = "Current status: Stage " + currrent_flashcard[Flashcards.STAGE]


func _on_save_button_question_pressed() -> void:
	currrent_flashcard[Flashcards.QUESTION] = $CardEditHBoxContainer/VBoxContainer/QuestionTextEdit.text


func _on_save_button_answer_pressed() -> void:
	currrent_flashcard[Flashcards.ANSWER] = $CardEditHBoxContainer/VBoxContainer/AnswerTextEdit.text


func _on_save_button_stage_pressed() -> void:
	currrent_flashcard[Flashcards.STAGE] = str($CardEditHBoxContainer/VBoxContainer/OptionButton.selected)
