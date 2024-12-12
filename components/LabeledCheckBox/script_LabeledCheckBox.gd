class_name LabeledCheckbox
extends PanelContainer

var id: int

var titleText: String
var checked: bool

@onready var titleTextLabel: Label = $VBoxContainer/titleText
@onready var checkBox: CheckBox = $VBoxContainer/CheckBox


# Called when the node enters the scene tree for the first time.
func _ready():
	titleTextLabel.text = titleText
	checkBox.set_pressed_no_signal(checked)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
