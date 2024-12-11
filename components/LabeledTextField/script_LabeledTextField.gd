class_name LabeledTextField
extends PanelContainer

const self_scene = preload("res://components/LabeledTextField/LabeledTextField.tscn")

var titleText: String
var placeHolderText: String
var value: String

var id: int

@onready var titleLabel: Label = $VBoxContainer/titleLabel
@onready var textBox: LineEdit = $VBoxContainer/LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = titleText
	textBox.placeholder_text = placeHolderText
	textBox.text = value
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

static func constructor(title: String, placeHolder: String, text: String) -> LabeledTextField:
	var obj: LabeledTextField = self_scene.instantiate()
	obj.id = ResourceUID.create_id()
	obj.titleText = title
	obj.placeHolderText = placeHolder
	obj.value = text
	return obj
