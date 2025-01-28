extends RigidBody2D


@export var landed: bool = false

signal just_landed

func _ready() -> void:
	hide()

func _on_roulette_wheel_spinning() -> void:
	self.position = Vector2(0,68).rotated(randf_range(0, 2*PI))
	print("set og position")
	freeze = false
	print("unfroze")
	reparent(get_tree().current_scene)
	print("reparented")
	print(get_parent())
	show()
	landed = false
	linear_damp = 0.0
	freeze = false
	linear_velocity = randf_range(450,600) * position.orthogonal().normalized()

func _physics_process(delta: float) -> void:
	if (!freeze):
		centripetal_force(delta)

func centripetal_force(delta: float) -> void:
	var pos_mag = position.length()
	var vel_mag = linear_velocity.length()
	constant_force = -position/(pos_mag/80)/(vel_mag)
	linear_velocity = linear_velocity.length() * position.orthogonal().normalized()
	if (pos_mag <= 55): constant_force = Vector2(0,0)
	if (pos_mag >= 70): position *= 68.0/pos_mag
