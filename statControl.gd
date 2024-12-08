class_name StatControl
extends Control

# preloads the statControl scene
const self_scene = preload("res://statControl.tscn")

# id for instance tracking
@export var statcontrol_id: int

# instantiates a StatControl object with a specified ID to return to other controls
static func constructor(label: String = "Stat") -> StatControl:
	var obj = self_scene.instantiate()
	obj.statcontrol_id = ResourceUID.create_id()
	ResourceUID.add_id(obj.statcontrol_id, obj.get_path())
	obj.get_node("StatControlPanel/statLabel").text = label
	return obj


