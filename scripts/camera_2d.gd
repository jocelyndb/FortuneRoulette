extends Camera2D

@export var shake_variance: float = 2.0
@export var shake_decay: float = 5

var shake_strength: float = 0.0

func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_decay * delta)
		offset = random_offset()
	
func apply_shake() -> void:
	$shake.play()
	shake_strength = shake_variance
	
func random_offset() -> Vector2:
	return Vector2(randf_range(-shake_strength,shake_strength),
		randf_range(-shake_strength,shake_strength))

func _on_roulette_wheel_spinning() -> void:
	%animate.play("menu-to-wheel")
	#$roll.play()
	apply_shake()

func _on_roulette_wheel_stopped(stopped_on: int) -> void:
	%animate.play("wheel-to-menu")
	$roll.stop()
	apply_shake()
