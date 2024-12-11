class_name MinMaxValueControlPanel
extends PanelContainer

const self_scene = preload("res://components/minMaxValueControlPanel/minMaxValueControlPanel.tscn")

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
	currentStatNumberChanger.stat = "current"

	maxStatNumberChanger.statValue = maxStatValue
	maxStatNumberChanger.stat = "max"

	currentStatNumberChanger.statValueUpdated.connect(_on_stat_value_change.bind())
	maxStatNumberChanger.statValueUpdated.connect(_on_stat_value_change.bind())


func _on_stat_value_change(stat, value):
	if stat == "current":
		currentStatValue = value
	elif stat == "max":
		maxStatValue = value




# instantiates a StatControl object with a specified ID to return to other controls
static func constructor(label: String = "Stat") -> MinMaxValueControlPanel:
	var obj = self_scene.instantiate()
	print('>>> new object: ', obj)
	obj.id = ResourceUID.create_id()
	obj.statName = label
	ResourceUID.add_id(obj.id, obj.scene_file_path)
	return obj


