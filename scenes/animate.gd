extends AnimationPlayer

@export var board_shown: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		if (board_shown):
			print("hiding board")
			play("board-hide")
		else:
			print("showing board")
			play("board-show")
		board_shown = !board_shown
		await get_tree().create_timer(1000).timeout
