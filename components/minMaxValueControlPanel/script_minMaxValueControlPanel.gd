class_name MinMaxValueControlPanel
extends PanelContainer

const self_scene = preload("res://components/MinMaxStatControl/minMaxValueControlPanel.tscn")
const statNumberChanger = preload("res://components/statNumberChanger/statNumberChanger.tscn")

var maxStatValue: int = 10
var currentStatValue: int = 10

# id for instance trackingS
@export var statcontrol_id: int
@export var statName: String = 'STAT'

func _ready():
	var currentValueChanger: StatNumberChanger = StatNumberChanger.constructor()
	var maxValueChanger: StatNumberChanger = StatNumberChanger.constructor()
	$HBoxContainer/CurrentValVBox.add_child(currentValueChanger)
	$HBoxContainer/MaxValVbox.add_child(maxValueChanger)
	$HBoxContainer/StatLabel.text = self.statName



# instantiates a StatControl object with a specified ID to return to other controls
static func constructor(label: String = "Stat") -> MinMaxStatControlPanel:
	var obj = self_scene.instantiate()
	obj.statcontrol_id = ResourceUID.create_id()
	obj.statName = label
	ResourceUID.add_id(obj.statcontrol_id, obj.scene_file_path)
	return obj


