extends PanelContainer

@onready var deleteButton: Button = $HBoxContainer/Button

func _ready():
	deleteButton.button_up.connect(_on_delete_button_up.bind())


func _on_delete_button_up():
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
