extends VBoxContainer

const PANEL_SIZE: int = 200

@onready var main_editing_zone: Control = $ScrollContainer/VBoxContainer

var no_of_grid_columns: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Adjusting the number of columns
	if (PANEL_SIZE * no_of_grid_columns < self.size.x
			and PANEL_SIZE * no_of_grid_columns > self.size.x - PANEL_SIZE):
		pass # Good size
	elif PANEL_SIZE * no_of_grid_columns > self.size.x:
		# Needs less columns
		if no_of_grid_columns > 1:
			no_of_grid_columns -= 1
	elif PANEL_SIZE * no_of_grid_columns + 1 < self.size.x:
		# Needs more columns
		no_of_grid_columns += 1
	
	# Apply the adjustment
	for node in main_editing_zone.get_children():
		if node is GridContainer:
			node.columns = no_of_grid_columns

func add_section_label(message: String) -> void:
	var new_label = Label.new()
	new_label.text = message
	new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	add_child(new_label)
	
func add_flashcard_grid(questions: Array[String]) -> void:
	var new_grid = GridContainer.new()
	for i in range(questions.size()):
		var new_panel = Panel.new()
		new_grid.add_child(new_panel)
	add_child(new_grid)
