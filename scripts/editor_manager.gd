extends VBoxContainer

const PANEL_SIZE: int = 200

@onready var grid_container = $ScrollContainer/VBoxContainer/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (PANEL_SIZE * grid_container.columns < self.size.x
			and PANEL_SIZE * grid_container.columns > self.size.x - PANEL_SIZE):
		pass # Good size
	elif PANEL_SIZE * grid_container.columns > self.size.x:
		# Needs less columns
		if grid_container.columns > 1:
			grid_container.columns -= 1
	elif PANEL_SIZE * grid_container.columns + 1 < self.size.x:
		# Needs more columns
		grid_container.columns += 1
