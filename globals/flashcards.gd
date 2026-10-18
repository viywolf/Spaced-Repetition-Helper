extends Node

enum{
	QUESTION, ANSWER, STAGE, ID
}

var cur_card_id: int = 1

var flashcards: Dictionary = {
	"Demo Flashcard":[
		["What is the powerhouse of the cell?", "Mitochondria is the powerhouse of the cell", "0", "0"],
		["Voltage is the...", "difference in electric potential between two points.", "0", "1"],
	],
}

func add_flashcard(question: String, answer: String):
	var cur_flashcards: Array = flashcards["Demo Flashcard"]
	cur_card_id += 1
	cur_flashcards.push_back([question, answer, "0", str(cur_card_id)])
