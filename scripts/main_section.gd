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
	
func show_editor_manager() -> void:
	$FlashcardManager.hide()
	$EditorManager.show()

func show_card_editor() -> void:
	pass
