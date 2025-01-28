extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var ball := body as RigidBody2D
	if not ball: return
	print("pin collision")
	if (ball.landed == false && ball.linear_velocity.length() < 5):
		print("landing ball", self)
		ball.landed = true
		ball.just_landed.emit()
		ball.freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
		ball.freeze = true
		ball.reparent(self)
		print(ball.global_position)
	else:
		ball.linear_damp *=1.1
		ball.linear_damp = max(ball.linear_damp, 0.6)
