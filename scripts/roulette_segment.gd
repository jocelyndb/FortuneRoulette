extends Polygon2D

@export var is_red: bool
@export var number: int

@export_enum("RED:0", "GREEN:1", "BLACK:2") var colour: int

signal got_ball

var is_spinning: bool = false
var already_collided: bool = false

func _ready() -> void:
	get_parent().connect("spinning", _on_spinning)
	if (colour == 0): color = Color.RED
	elif (colour == 1): color = Color.GREEN
	else: color = Color.BLACK
	%label.text = String.num(number)
		
# Returns segment number if collided with ball
# otherwise returns -1
func stopped_here() -> bool:
	is_spinning = false
	$ray.force_raycast_update()
	return $ray.is_colliding()
		
func _on_spinning() -> void:
	is_spinning = true

func _process(delta: float) -> void:
	if (is_spinning):
		$ray.force_raycast_update()
		if (not $ray.get_collider()): already_collided = false
		elif (not already_collided): 
			%roll.play()
			#print("Ticked past ", number)
			already_collided = true
		#else: print("ignoring this one!")
	
