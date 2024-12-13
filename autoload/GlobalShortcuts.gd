extends Node

var inventory_window: InventoryComponent

func _ready():
	# Wait for the main scene to be ready
	await get_tree().root.ready
	# Find the inventory window
	inventory_window = get_tree().root.find_child("InventoryWindow", true, false)

func _input(event: InputEvent):
	if event.is_action_pressed("ui_inventory") and not get_viewport().gui_get_focus_owner():
		_toggle_inventory()

func _toggle_inventory():
	if inventory_window:
		if inventory_window.visible:
			inventory_window.hide_window()
		else:
			inventory_window.show_window()
