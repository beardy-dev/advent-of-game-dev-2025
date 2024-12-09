class_name StatControl
extends PanelContainer

const self_scene = preload("res://statControl.tscn")
const gearIcon = preload("res://gear-cog.png")
#const saveIcon = preload("res://assets/icons/floppy-disk.png")

enum EditState {READ,WRITE}
var currentState: EditState
var maxStatValue: int = 0
var currentStatValue: int = 0

# id for instance trackingS
@export var statcontrol_id: int
@export var statName: String = ''

func _ready():
	self.currentState = EditState.READ
	self.uiSetup()
	self.buttonSetup()
	self.signalSetup()

func uiSetup():
	$HBoxContainer/statLabel.text = self.statName
	$HBoxContainer/StatControlPanelEdit/statCurrentValue.text = String.num_int64(self.currentStatValue)
	$HBoxContainer/StatControlPanelEdit/statMaxValue.text = String.num_int64(self.maxStatValue)
	$HBoxContainer/StatControlPanelRead/statCurrentValue.text = String.num_int64(self.currentStatValue)
	$HBoxContainer/StatControlPanelRead/statMaxValue.text = String.num_int64(self.maxStatValue)


func buttonSetup():
	$Button.set_size(Vector2(16,16))



func signalSetup():
	$Button.button_up.connect(_on_edit_save_button_pressed)


func _on_edit_save_button_pressed():
	print('button pressed', statName)
	if(self.currentState == EditState.READ):
		$HBoxContainer/StatControlPanelRead.visible = false
		$HBoxContainer/StatControlPanelEdit.visible = true
		self.currentState = EditState.WRITE
	else:
		self.currentStatValue = int($HBoxContainer/StatControlPanelEdit/statCurrentValue.text)
		self.maxStatValue = int($HBoxContainer/StatControlPanelEdit/statMaxValue.text)
		$HBoxContainer/StatControlPanelRead.visible = true
		$HBoxContainer/StatControlPanelEdit.visible = false
		self.currentState = EditState.READ
		self.uiSetup()


# instantiates a StatControl object with a specified ID to return to other controls
static func constructor(label: String = "Stat") -> StatControl:
	var obj = self_scene.instantiate()
	obj.statcontrol_id = ResourceUID.create_id()
	obj.statName = label
	ResourceUID.add_id(obj.statcontrol_id, obj.scene_file_path)
	return obj


