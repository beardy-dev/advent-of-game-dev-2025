extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	var strengthControl: StatControl = StatControl.constructor(1, "Strength");
	strengthControl.name = "StrengthControl"
	add_to_group("StatControls")
	add_child(strengthControl)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

