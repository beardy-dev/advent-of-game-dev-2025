class_name MainUI
extends FlowContainer

@onready var inventory_window: InventoryComponent = $InventoryWindow
@onready var inventory_button: Button = $InventoryButton

var sheet_config: Array[Dictionary] = [
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "STR",
			"maxStatValue": 10,
			"currentStatValue": 10
		},
		"objectRef": null
	},
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "DEX",
			"maxStatValue": 10,
			"currentStatValue": 10
		},
		"objectRef": null
	},
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "WIT",
			"maxStatValue": 10,
			"currentStatValue": 10
		},
		"objectRef": null
	},
	{
		"type": "MinMaxValueControlPanel",
		"props": {
			"statName": "SPI",
			"maxStatValue": 10,
			"currentStatValue": 10
		},
		"objectRef": null
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "Fatigue",
			"statValue": 0
		},
		"objectRef": null
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "Mead",
			"statValue": 0
		},
		"objectRef": null
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "Souls",
			"statValue": 0
		},
		"objectRef": null
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "SPD",
			"statValue": 40
		},
		"objectRef": null
	},
	{
		"type": "StatNumberChanger",
		"props": {
			"statText": "DEF",
			"statValue": 0
		},
		"objectRef": null
	},
	{
		"type": "OptionPicker",
		"props": {
			"titleText": "Background",
			"options": ["Warrior", "Scout", "Seer", "Skald"]
		},
		"objectRef": null
	},
	{
		"type": "LabeledTextField",
		"props": {
			"titleText": "Name",
			"placeHolderText": "Adventurer",
			"value": ""
		},
		"objectRef": null
	},
	{
		"type": "LabeledCheckbox",
		"props": {
			"titleText": "Cursed?",
			"checked": true
		},
		"objectRef": null
	},
	{
		"type": "LabeledCheckbox",
		"props": {
			"titleText": "Deprived?",
			"checked": true
		},
		"objectRef": null
	},
	{
		"type": "LabeledCheckbox",
		"props": {
			"titleText": "Poisoned?",
			"checked": true
		},
		"objectRef": null
	},
	{
		"type": "Inventory",
		"props": {
			"items": []
		},
		"objectRef": null
	}
]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)
	for field in sheet_config:
		var obj = null
		var objName = null
		if field.get("type") == "MinMaxValueControlPanel":
			objName = field.props.get("statName")
			obj = initMinMaxValueControl(field.get("props"))
		elif field.get("type") == "StatNumberChanger":
			objName = field.props.get("statText")
			obj = initStatNumberChanger(field.get("props"))
		elif field.get("type") == "OptionPicker":
			objName = field.props.get("titleText")
			obj = initOptionPicker(field.get("props"))
		elif field.get("type") == "LabeledTextField":
			objName = field.props.get("titleText")
			obj = initLabeledTextField(field.get("props"))
		elif field.get("type") == "LabeledCheckbox":
			objName = field.props.get("titleText")
			obj = initLabeledCheckbox(field.get("props"))
		elif field.get("type") == "Inventory":
			objName = "Inventory"
			obj = initInventory()
		if obj != null:
			print(">>> obj: ", obj)
			add_child(obj)
			field.objectRef = obj

	# Connect inventory button
	inventory_button.pressed.connect(_on_inventory_button_pressed)

func _on_inventory_button_pressed():
	_toggle_inventory()

func _toggle_inventory():
	if inventory_window.visible:
		inventory_window.hide_window()
	else:
		inventory_window.show_window()

func initMinMaxValueControl(props: Dictionary) -> MinMaxValueControlPanel:
	var statName: String = props.get("statName")
	var currentStatValue: int = props.get("currentStatValue")
	var maxStatValue: int = props.get("maxStatValue")
	var minMaxControl = load("res://components/minMaxValueControlPanel/minMaxValueControlPanel.tscn").instantiate()
	minMaxControl.name = statName
	minMaxControl.statName = statName
	minMaxControl.currentStatValue = currentStatValue
	minMaxControl.maxStatValue = maxStatValue
	return  minMaxControl

func initStatNumberChanger(props: Dictionary) -> StatNumberChanger:
	var statText: String = props.get("statText")
	var statValue: int = props.get("statValue")
	var statNumberChanger: StatNumberChanger = load("res://components/statNumberChanger/statNumberChanger.tscn").instantiate()
	statNumberChanger.statText = statText
	statNumberChanger.statValue = statValue
	return statNumberChanger

func initOptionPicker(props:Dictionary) -> OptionPicker:
	var titleText: String = props.get("titleText")
	var options: Array = props.get("options")
	var optionPicker: OptionPicker = load("res://components/OptionPicker/OptionPicker.tscn").instantiate()
	optionPicker.titleText = titleText
	optionPicker.options = options
	return optionPicker

func initLabeledTextField(props: Dictionary) -> LabeledTextField:
	var titleText: String = props.get("titleText")
	var placeHolderText: String = props.get("placeHolderText")
	var value: String = props.get("value")
	var labeledTextField: LabeledTextField = load("res://components/LabeledTextField/LabeledTextField.tscn").instantiate()
	labeledTextField.titleText = titleText
	labeledTextField.placeHolderText = placeHolderText
	labeledTextField.value = value
	return labeledTextField

func initLabeledCheckbox(props: Dictionary) -> LabeledCheckbox:
	var titleText: String = props.get("titleText")
	var checked: bool = props.get("checked")
	var labeledTextField: LabeledCheckbox = load("res://components/LabeledCheckbox/LabeledCheckbox.tscn").instantiate()
	labeledTextField.titleText = titleText
	labeledTextField.checked = checked
	return labeledTextField

func initInventory():
	var inventoryScene = load("res://components/InventoryComponent/InventoryComponent.tscn")
	return inventoryScene.instantiate()

func _process(_delta):
	pass


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print(">>> Close Request")
		for field in sheet_config:
			var object_ref = field.get("objectRef")
			match field.get("type"):
				"MinMaxValueControlPanel":
					field["props"]["currentStatValue"] = object_ref.get("currentStatValue")
					field["props"]["maxStatValue"] = object_ref.get("maxStatValue")
				"StatNumberChanger":
					field["props"]["statValue"] = object_ref.get("statValue")
				"OptionPicker":
					field["props"]["options"] = object_ref.get("options")
				"Inventory":
					var inventory: Node = object_ref.get_node("./PanelContainer/VBoxContainer/InventoryScrollContainer/InventoryContainer")
					print(">>> inventory: ", inventory, inventory.get_children())