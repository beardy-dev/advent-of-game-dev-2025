class_name LabeledTextField
extends PanelContainer

@export var titleText: String
@export var placeHolderText: String
@export var textSize: int
var value: String

var id: int

@onready var titleLabel: Label = $VBoxContainer/titleLabel
@onready var textBox: LineEdit = $VBoxContainer/LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = titleText
	textBox.placeholder_text = placeHolderText
	textBox.text = value

	if textSize:
		titleLabel.add_theme_font_size_override("font_size", textSize)
		textBox.add_theme_font_size_override("font_size", textSize)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
