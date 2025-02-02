extends Area2D

@export var number: int

signal bet_placed(number: int)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$num_text.text = str(number)
	connect("bet_placed", get_parent().get_parent()._on_bet_placed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton 
		&& event.button_index == MOUSE_BUTTON_LEFT
		&& event.is_pressed()):
		bet_placed.emit(number)
		$player.play()
	pass # Replace with function body.
