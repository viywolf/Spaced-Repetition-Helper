extends Node

enum{
	QUESTION, ANSWER, STAGE
}

var demo_flashcards: Dictionary = {
	"Demo Flashcard":[
		["What is the powerhouse of the cell?", "Mitochondria is the powerhouse of the cell", "0"],
		["Voltage is the...", "difference in electric potential between two points.", "0"],
	],
}

func add_flashcard(question: String, answer: String):
	var cur_flashcards: Array = demo_flashcards["Demo Flashcard"]
	cur_flashcards.push_back([question, answer, "0"])
