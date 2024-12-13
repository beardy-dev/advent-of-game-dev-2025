class_name InventoryComponent
extends Window

var id: int

@onready var addItemButton: Button = $PanelContainer/VBoxContainer/HeaderContainer/AddItemButton
@onready var itemPopUpMenu: PopupMenu = $PanelContainer/VBoxContainer/HeaderContainer/ItemTypePopUpMenu
@onready var inventory: VBoxContainer = $PanelContainer/VBoxContainer/InventoryScrollContainer/InventoryContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	addItemButton.button_up.connect(_on_add_item_button_press.bind())
	itemPopUpMenu.index_pressed.connect(_on_item_menu_index_pressed.bind())
	close_requested.connect(_on_close_requested)
	
func _input(event: InputEvent):
	if event.is_action_pressed("ui_inventory"):
		get_viewport().set_input_as_handled()
		if visible:
			hide_window()
		else:
			show_window()
	
func show_window():
	visible = true
	
func hide_window():
	visible = false

func _on_close_requested():
	hide_window()

func _on_add_item_button_press():
	itemPopUpMenu.show()

func _on_item_menu_index_pressed(index: int):
	if index == 0:
		var weaponItemScene = load("res://components/InventoryComponent/ItemComponents/WeaponItemComponent/WeaponItemComponent.tscn")
		inventory.add_child(weaponItemScene.instantiate())
