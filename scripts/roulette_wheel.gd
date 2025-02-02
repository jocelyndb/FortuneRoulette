extends RigidBody2D

signal stopped (on_number: int)
signal spinning

var segment = preload("res://scenes/roulette_segment.tscn")
var segments: Array

func _ready() -> void:
	for i in 38:
		var next_segment = segment.instantiate()
		next_segment.number = Constants.roulette_nums[i]
		if Constants.red_nums.has(Constants.roulette_nums[i]): 
			next_segment.colour = 0
		elif Constants.green_nums.has(Constants.roulette_nums[i]): 
			next_segment.colour = 1
		elif Constants.black_nums.has(Constants.roulette_nums[i]): 
			next_segment.colour = 2
		else: print("you fucked up the numbers")
		add_child(next_segment)
		print(Constants.roulette_nums[i])
		next_segment.rotation = i * 2*PI/38
		segments.append(next_segment)

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
	for segment in segments:
		if segment.stopped_here():
			stopped.emit(segment.number)
			print("Stopped on ", segment.number)
			return		
	stopped.emit() 
