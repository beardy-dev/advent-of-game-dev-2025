class_name StatNumberChanger
extends PanelContainer

var id: int

var statValue: int = 10
@export var statText: String = "STAT"

@onready var incrementButton: Button = $VBoxContainer/HBoxContainer/VBoxContainer/IncrementButton
@onready var decrementButton: Button = $VBoxContainer/HBoxContainer/VBoxContainer/DecrementButton
@onready var statValueLabel: Label = $VBoxContainer/HBoxContainer/StatValueLabel
@onready var titleLable: Label = $VBoxContainer/titleLabel

signal statValueUpdated(updatedValue)

# Called when the node enters the scene tree for the first time.
func _ready():
	incrementButton.button_up.connect(_on_increment_button_up.bind())
	decrementButton.button_up.connect(_on_decrement_button_up.bind())
	titleLable.text = statText


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	statValueLabel.text = String.num_int64(statValue)

func _on_increment_button_up():
	self.statValue += 1
	statValueUpdated.emit(statText, statValue)

func _on_decrement_button_up():
	self.statValue -= 1
	statValueUpdated.emit(statText, statValue)
