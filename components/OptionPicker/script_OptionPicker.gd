class_name OptionPicker
extends PanelContainer

const self_scene = preload("res://components/OptionPicker/OptionPicker.tscn")

var id: int
var titleText: String
var options: Array

@onready var titleLabel: Label = $VBoxContainer/Title
@onready var optionButton: OptionButton = $VBoxContainer/OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = titleText
	for i in range(options.size()):
		optionButton.add_item(options[i], i+1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


static func constructor(title: String = "Options", opt: Array = []) -> OptionPicker:
	var obj: OptionPicker = self_scene.instantiate()
	obj.id = ResourceUID.create_id()
	obj.titleText = title
	obj.options = opt
	return obj
