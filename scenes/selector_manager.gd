extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_set_label("Hello world")


func create_section_label(message: String) -> void:
	var section_label := RichTextLabel.new()
	section_label.text = message
	add_child(section_label)
	
func create_set_label(label_text: String) -> void:
	var hbox := HBoxContainer.new()
	
	var set_label := Label.new()
	set_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	set_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	set_label.text = label_text
	
	var edit_button := Button.new()
	edit_button.text = "Edit"
	
	hbox.add_child(set_label)
	hbox.add_child(edit_button)
	
	self.add_child(hbox)
