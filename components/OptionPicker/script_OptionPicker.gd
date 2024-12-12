class_name OptionPicker
extends PanelContainer

var id: int
@export var titleText: String
@export var options: Array
@export var textSize: int

@onready var titleLabel: Label = $VBoxContainer/Title
@onready var optionButton: OptionButton = $VBoxContainer/OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = titleText
	if textSize:
		titleLabel.add_theme_font_size_override("font_size",textSize)
		optionButton.add_theme_font_size_override("font_size", textSize)
	for i in range(options.size()):
		optionButton.add_item(options[i], i+1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
