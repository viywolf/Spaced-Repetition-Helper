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

func update_info() -> void:
	currrent_flashcard = Flashcards.flashcards["Demo Flashcard"][current_flashcard_id]
	$CardEditTitle.text = "Editing flashcard " + str(current_flashcard_id)
	$CardEditHBoxContainer/VBoxContainer/QuestionTextEdit.text = currrent_flashcard[Flashcards.QUESTION]
	$CardEditHBoxContainer/VBoxContainer/AnswerTextEdit.text = currrent_flashcard[Flashcards.ANSWER]
	$CardEditHBoxContainer/VBoxContainer/Label.text = "Current status: Stage " + currrent_flashcard[Flashcards.STAGE]
