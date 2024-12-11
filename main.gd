class_name MainUI
extends FlowContainer

var stats = ['STR', 'DEX', 'SPI', 'WIT']

# Called when the node enters the scene tree for the first time.
func _ready():
	for stat in stats:
		var statControl = MinMaxValueControlPanel.constructor(stat)
		statControl.set_anchors_preset(Control.PRESET_CENTER)

		add_child(statControl)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

