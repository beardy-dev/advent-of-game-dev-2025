class_name InventoryComponent
extends PanelContainer

var id: int

@onready var addItemButton: Button = $VBoxContainer/HeaderContainer/AddItemButton
@onready var itemPopUpMenu: PopupMenu = $VBoxContainer/HeaderContainer/ItemTypePopUpMenu
@onready var inventory: VBoxContainer = $VBoxContainer/InventoryScrollContainer/InventoryContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	addItemButton.button_up.connect(_on_add_item_button_press.bind())
	itemPopUpMenu.index_pressed.connect(_on_item_menu_index_pressed.bind())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_add_item_button_press():
	itemPopUpMenu.show()
	pass

func _on_item_menu_index_pressed(index: int):
	if index == 0:
		var weaponItemScene = load("res://components/InventoryComponent/ItemComponents/WeaponItemComponent/WeaponItemComponent.tscn")
		inventory.add_child(weaponItemScene.instantiate())
	pass


# static func constructor() -> InventoryComponent:
# 	var obj = load("res://components/InventoryComponent/InventoryComponent.tscn").instantiate()
# 	obj.id = ResourceUID.create_id()
# 	return obj
