extends Node

const STAGE_TO_TIME_LEFT = {
	0: 1,
	1: 3,
	2: 7,
	3: 14,
	4: 30,
	5: 60,
	6: 999,
}

enum{
	QUESTION, ANSWER, STAGE, TIME_LEFT, IS_READY_TO_REVIEW, ID
}

var cur_card_id: int = 1

var flashcards: Dictionary = {
	"Demo Flashcard":[
		["What is the powerhouse of the cell?", "Mitochondria is the powerhouse of the cell", "0", "0", true, "0"],
		["Voltage is the...", "difference in electric potential between two points.", "0", "0", true, "1"],
	],
}

func add_flashcard(question: String, answer: String) -> void:
	var cur_flashcards: Array = flashcards["Demo Flashcard"]
	cur_card_id += 1
	cur_flashcards.push_back([question, answer, "0", "0", true, str(cur_card_id)])

func advance_time() -> void:
	for arr in flashcards["Demo Flashcard"]:
		arr[TIME_LEFT] = float(arr[TIME_LEFT]) - 1
		if is_zero_approx(float(arr[TIME_LEFT])):
			arr[IS_READY_TO_REVIEW] = true
			if arr[STAGE] == "0":
				pass
			else:
				set_stage(int(arr[STAGE]) + 1, int(arr[ID]))
				
func set_stage(stage_no: int, flashcard_id: int):
	flashcards["Demo Flashcard"][flashcard_id][STAGE] = str(stage_no)
	flashcards["Demo Flashcard"][flashcard_id][TIME_LEFT] = str(STAGE_TO_TIME_LEFT[stage_no])
