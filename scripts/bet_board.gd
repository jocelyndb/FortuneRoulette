extends Node

var bets: Dictionary
var chip = preload("res://textures/cursor.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_bet_placed(number: int) -> void:
	bets[number] = bets.get_or_add(number, 0) + 1
	print("%s bets on %s" % [bets[number], number])
	var placed_chip = Sprite2D.new() 
	placed_chip.position = get_viewport().get_camera_2d().to_local(get_viewport().get_camera_2d().get_global_mouse_position() - Vector2($board.scale.x * $board.texture.get_width() / 1.95, 0))
	
	placed_chip.texture = load("res://textures/cursor.png")
	placed_chip.z_index = 5
	placed_chip.z_as_relative = false
	placed_chip.scale = Vector2(.5,.5)
	add_child(placed_chip)
	print("spawned chip at %s" % placed_chip.position)
	pass
