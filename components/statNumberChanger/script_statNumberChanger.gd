class_name StatNumberChanger
extends PanelContainer

var statValue: int = 10
var stat: String = "STAT"

@onready var incrementButton: Button = $VBoxContainer/IncrementButton
@onready var decrementButton: Button = $VBoxContainer/DecrementButton
@onready var statValueLabel: Label = $VBoxContainer/StatValueLabel

signal statValueUpdated(updatedValue)

# Called when the node enters the scene tree for the first time.
func _ready():
	incrementButton.button_up.connect(_on_increment_button_up.bind())
	decrementButton.button_up.connect(_on_decrement_button_up.bind())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	statValueLabel.text = String.num_int64(statValue)

func _on_increment_button_up():
	self.statValue += 1
	statValueUpdated.emit(stat, statValue)

func _on_decrement_button_up():
	self.statValue -= 1
	statValueUpdated.emit(stat, statValue)
