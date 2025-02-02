extends RigidBody2D

@export var landed: bool = false

signal just_landed

func _ready() -> void:
	hide()

func _on_roulette_wheel_spinning() -> void:
	reparent(get_tree().current_scene)
	var new_pos = Vector2(0,68).rotated(randf_range(0, 2*PI))
	position = to_local(new_pos)
	print(position)
	print(new_pos)
	linear_velocity = randf_range(450,600) * new_pos.orthogonal().normalized().rotated(-rotation - PI/20)
	print("set og position")
	show()
	landed = false
	freeze = false
	linear_damp = 0.0

func _physics_process(delta: float) -> void:
	if (!freeze):
		centripetal_force(delta)

func centripetal_force(delta: float) -> void:
	var pos_mag = global_position.length()
	var vel_mag = linear_velocity.length()
	constant_force = -global_position/(pos_mag/80)/(vel_mag)
	linear_velocity = linear_velocity.length() * global_position.orthogonal().normalized()
	if (pos_mag <= 55): constant_force = Vector2(0,0)
	if (pos_mag >= 75): global_position *= 70.0/pos_mag
	if (constant_force.length_squared() > 100):
		print("correcting")
		#global_position -= 100*global_position.normalized() * delta
		_on_roulette_wheel_spinning()
		
