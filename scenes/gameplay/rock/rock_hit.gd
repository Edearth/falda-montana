extends Area2D

const push_down_velocity: float = 100

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		push_player_down(body)

func break_rock():
	queue_free()

func push_player_down(player: Node2D):
	set_deferred("monitoring", false)
	Global.rock_manager.propagate_call("set_sleeping", [true])
	player.velocity = Vector2.DOWN * push_down_velocity
	var tween := Global.create_shake_node2d_tween(player)
	tween.tween_callback(restart_physics_and_free)

func restart_physics_and_free():
	Global.rock_manager.propagate_call("set_sleeping", [false])
	call_deferred("queue_free")
	get_parent().queue_free()
