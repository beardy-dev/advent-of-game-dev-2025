class_name StatControl
extends Control

# preloads the statControl scene
const self_scene = preload("res://statControl.tscn")
var statLabel
var statCurrentVal
var statMaxVal

# id for instance tracking
@export var statcontrol_id: int

# instantiates a StatControl object with a specified ID to return to other controls
static func constructor(id: int = 0, label: String = "Stat") -> StatControl:
	var obj = self_scene.instantiate();
	obj.statcontrol_id = id;
	obj.get_node("StatControlPanel/statLabel").text = label
	return obj


