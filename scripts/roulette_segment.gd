extends Polygon2D

@export var is_red: bool
@export var number: int

signal got_ball

func _ready() -> void:
	get_parent().connect("stopped", _on_stopped)
	if (is_red):
		color = Color.RED
	else:
		color = Color.BLACK
	%label.text = String.num(number)

func _on_stopped() -> void:
	$ray.force_raycast_update()
	var collided_with = $ray.get_collider()
	if (collided_with): 
		print(collided_with)
		print(number)
		# TODO: send signal with info
