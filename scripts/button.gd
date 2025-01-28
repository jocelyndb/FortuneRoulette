extends Button

func _on_pressed() -> void:
	z_index = -100
	disabled = true
	shortcut_in_tooltip = false

func _on_roulette_wheel_stopped() -> void:
	print("redrawing")
	z_index = 20
	disabled = false
	shortcut_in_tooltip = true
