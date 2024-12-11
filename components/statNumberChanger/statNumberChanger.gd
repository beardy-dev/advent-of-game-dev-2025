class_name StatNumberChanger
extends PanelContainer

const self_scene = preload('res://components/statNumberChanger/statNumberChanger.tscn')

@export var id: int

var statValue: int

signal statValueUpdated

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/IncrementButton.button_up.connect(_on_increment_button_up.bind())
	$VBoxContainer/DecrementButton.button_up.connect(_on_decrement_button_up.bind())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$VBoxContainer/StatValueLabel.text = String.num_int64(statValue)

func _on_increment_button_up():
	self.statValue += 1
	statValueUpdated.emit(self.statValue)

func _on_decrement_button_up():
	self.statValue -= 1
	statValueUpdated.emit(self.statValue)

static func constructor(value: int = 10) -> StatNumberChanger:
	var newObject =  self_scene.instantiate();
	newObject.id = ResourceUID.create_id()
	newObject.statValue = value
	ResourceUID.add_id(newObject.id, newObject.scene_file_path)
	return newObject
