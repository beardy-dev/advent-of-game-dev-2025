class_name MainUI
extends FlowContainer

var sheet_config: Array[Dictionary] = [
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "STR",
			"maxStatValue": 10,
			"currentStatValue": 10
		}
	},
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "DEX",
			"maxStatValue": 10,
			"currentStatValue": 10
		}
	},
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "WIT",
			"maxStatValue": 10,
			"currentStatValue": 10
		}
	},
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "SPI",
			"maxStatValue": 10,
			"currentStatValue": 10
		}
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "Fatigue",
			"statValue": 0
		}
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "Mead",
			"statValue": 0
		}
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "Souls",
			"statValue": 0
		}
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "SPD",
			"statValue": 40
		}
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "DEF",
			"statValue": 0
		}
	},
	{
		"type": "OptionPicker",
		"props": {
			"titleText": "Background",
			"options": ["Warrior", "Scout", "Seer", "Skald"]
		}
	},
	{
		"type": "LabeledTextField",
		"props": {
			"titleText": "Name",
			"placeHolderText": "Adventurer",
			"value": ""
		}
	},
	{
		"type": "LabeledCheckbox",
		"props": {
			"titleText": "Cursed?",
			"checked": true
		}
	},
	{
		"type": "LabeledCheckbox",
		"props": {
			"titleText": "Deprived?",
			"checked": true
		}
	},
	{
		"type": "LabeledCheckbox",
		"props": {
			"titleText": "Poisoned?",
			"checked": true
		}
	},
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for field in sheet_config:
		var obj = null
		if field.get("type") == "MinMaxValueControlPanel":
			obj = initMinMaxValueControl(field.get("props"))
		elif field.get("type") == "StatNumberChanger":
			obj = initStatNumberChanger(field.get("props"))
		elif field.get("type") == "OptionPicker":
			obj = initOptionPicker(field.get("props"))
		elif field.get("type") == "LabeledTextField":
			obj = initLabeledTextField(field.get("props"))
		elif field.get("type") == "LabeledCheckbox":
			obj = initLabeledCheckbox(field.get("props"))
		if obj != null:
			ResourceUID.add_id(obj.id, obj.scene_file_path)
			add_child(obj)
	pass

func initMinMaxValueControl(props: Dictionary) -> MinMaxValueControlPanel:
	var statName: String = props.get("statName")
	var currentStatValue: int = props.get("currentStatValue")
	var maxStatValue: int = props.get("maxStatValue")
	return  MinMaxValueControlPanel.constructor(statName, currentStatValue, maxStatValue)

func initStatNumberChanger(props: Dictionary) -> StatNumberChanger:
	var statText: String = props.get("statText")
	var statValue: int = props.get("statValue")
	return StatNumberChanger.constructor(statText, statValue)


func initOptionPicker(props:Dictionary) -> OptionPicker:
	var titleText: String = props.get("titleText")
	var options: Array = props.get("options")
	return  OptionPicker.constructor(titleText, options)

func initLabeledTextField(props: Dictionary) -> LabeledTextField:
	var titleText: String = props.get("titleText")
	var placeHolderText: String = props.get("placeHolderText")
	var value: String = props.get("value")
	return LabeledTextField.constructor(titleText, placeHolderText, value)

func initLabeledCheckbox(props: Dictionary) -> LabeledCheckbox:
	var titleText: String = props.get("titleText")
	var checked: bool = props.get("checked")
	return LabeledCheckbox.constructor(titleText, checked)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

