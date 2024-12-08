class_name MainUI
extends Control

var stats = ['Strength', 'Dexterity', 'Spirit', 'Wits']

# Called when the node enters the scene tree for the first time.
func _ready():
	for stat in stats:
		var statControl = StatControl.constructor(stat)
		add_child(statControl)
	print('>>> MY CHILDREN: ', get_children())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

