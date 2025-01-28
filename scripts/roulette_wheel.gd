extends RigidBody2D

signal stopped
signal spinning

var segment = preload("res://scenes/roulette_segment.tscn")

var roulette_nums: Array[int] = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 
	5, 22, 34, 15, 3, 24, 36, 13, 1, 00, 27, 10, 25, 29, 12, 8, 
	19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

func _ready() -> void:
	for i in 38:
		var next_segment = segment.instantiate()
		next_segment.is_red = (i % 2 == 0)
		next_segment.number = roulette_nums[i]
		add_child(next_segment)
		print(roulette_nums[i])
		next_segment.rotation = i * 2*PI/38

func _on_mouse_entered() -> void:
	print("test")
	pass
	
func _process(delta_t: float) -> void:
	angular_velocity = 0.3490658504

func _on_button_pressed() -> void:
	print('spinning!')
	print(rotation)
	spinning.emit()

func _on_ball_just_landed() -> void:
	stopped.emit()
