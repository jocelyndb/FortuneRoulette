extends Node2D

@export var radius: float
@export var color: Color
@export var filled: bool
@export var width: float

func _draw() -> void:
	draw_circle(position, radius, color, filled, width, true)
	z_index = 5
