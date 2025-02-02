extends Node2D

func _ready() -> void:
	randomize()
	


func _on_roulette_wheel_stopped(on_number: int) -> void:
	var stopped_string: String = String.num(on_number)
	# TODO: update budget and do calculations!
	#$budget.text = 
	$title.text = "[pulse freq=10.0 color=#dddddd ease=10]" + stopped_string.repeat(20) + "[/pulse]"
	$title.position.x = -150
	pass # Replace with function body.
