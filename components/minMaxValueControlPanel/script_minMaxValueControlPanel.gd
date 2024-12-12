class_name MinMaxValueControlPanel
extends PanelContainer

var maxStatValue: int = 10
var currentStatValue: int = 10

@onready var statLabel: Label  = $HBoxContainer/StatLabel
@onready var currentStatNumberChanger: StatNumberChanger = $HBoxContainer/CurrentValVBox/StatNumberChanger
@onready var maxStatNumberChanger: StatNumberChanger = $HBoxContainer/MaxValVbox/StatNumberChanger

# id for instance trackingS
@export var id: int
@export var statName: String = 'STAT'

func _ready():
	statLabel.text = statName
	currentStatNumberChanger.statValue = currentStatValue

	maxStatNumberChanger.statValue = maxStatValue


	currentStatNumberChanger.statValueUpdated.connect(_on_stat_value_change.bind())
	maxStatNumberChanger.statValueUpdated.connect(_on_stat_value_change.bind())


func _on_stat_value_change(stat, value):
	if stat == "current":
		currentStatValue = value
	elif stat == "max":
		maxStatValue = value


